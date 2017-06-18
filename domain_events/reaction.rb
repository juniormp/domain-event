require 'securerandom'

module DomainEvents
	class Reaction
		attr_reader :event_uuid, :metadata

		def initialize(attributes)
			@event_uuid = SecureRandom.uuid
			@metadata = {timestamp: Time.now, name: self.class.name}
			event_definition(attributes)
			freeze
		end
	end
end

# Reaction = It is the event that will notify the observee
# Every reaction must have an id and your metadata for better controll of all events will be dispatcher
# event_definition = What the event will do