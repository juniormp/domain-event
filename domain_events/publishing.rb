require_relative 'subscription'

module DomainEvents
	class Publishing
		def self.instance
			@@event_publisher ||= new
		end

		def self.configure
			yield instance
			instance.lock
		end

		def initialize
			@subscribers = []
		end

		def add_reaction(reaction, subscriber)
     		@subscribers << Subscription.new(reaction: reaction, observee: subscriber)
		end

		def publish(event)
	      @subscribers.select { |sub| sub.matches_reaction?(event.class.name) }.each do |subscriber|
	        subscriber.dispatch(event)
	      end
		end

		def lock
			@subscribers.freeze
			freeze
		end
	end
end

# Publishing = Responsible for publish the event to the follow subscriber
# add_reaction = add subscribers (event and observee)
# publish = Will notify the observee with the follow event that matches