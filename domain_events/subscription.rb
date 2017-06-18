module DomainEvents 
	class Subscription
		attr_reader :reaction, :observee

		def initialize(reaction:, observee:)
			@reaction = reaction
			@observee = observee
		end

		def matches_reaction?(given_reaction)
			reaction == given_reaction
		end

		def dispatch(event)
			observee.new.update(event)
		end
	end
end

# Subscription = UseCase that subscribed to be notified by one event
# reaction = It is the event that will send to the observee
# observee = It is the UseCase that wants to be notified 