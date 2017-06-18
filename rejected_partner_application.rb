require_relative 'domain_events/reaction'

class RejectedPartnerApplication < DomainEvents::Reaction
	attr_reader :id, :rejected_at

  def event_definition(rejected_partner_application)
    puts "\nAttributes from DomainEvents::Reaction"
    puts "Event uuid: #{@event_uuid}"
    puts "Meta data: #{@metadata}"

    @id = rejected_partner_application.id
    @rejected_at = rejected_partner_application.rejected_at

    puts "\nAttributes from RejectedPartnerApplication"
    puts "id: #{@id}"
    puts "rejected_at: #{@rejected_at}"
  end
end

# RejectedPartnerApplication = It is an event that will notify 
# the observee when the PartnerApplication is rejected