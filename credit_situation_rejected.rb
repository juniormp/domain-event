require_relative 'domain_events/subscription'

class CreditSituationRejected < DomainEvents::Subscription
  def update(partner_application_rejected)
  	puts "AQUIIIi"
    puts "Event: #{partner_application_rejected.inspect}"
  end
end