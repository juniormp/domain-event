require 'domain_events/publishing'

class UseCase
  def initialize
    event_publisher = DomainEvents::Publishing.instance
  end

  def acting_like_a_fool
    transaction do
      repository.update(partner_application.reject(event_publisher))
    end
  end
end