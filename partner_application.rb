require_relative 'domain_events/publishing'
require_relative 'rejected_partner_application'

class PartnerApplication
  attr_accessor :rejected_at
  attr_reader :id, :name

  def initialize(id, name)
    @id, @name = id, name
  end

  def reject(event_publishing: DomainEvents::Publishing.instance)
    update(rejected_at: Time.now).tap do |updated_pa|
      event_publishing.publish(
        RejectedPartnerApplication.new(updated_pa)
      )
    end
  end

  def update(attributes = {})
    clone.tap do |dupe|
      attributes.each do |attr, value|
        dupe.public_send("#{attr}=", value)
      end
    end
  end
end


# PartnerApplication = Entity 
# reject = When a PartnerApplication is rejected do
## update the Entity with the time that was rejected and
## publish an event (RejectedPartnerApplication) to notify the observee (CreditSituationRejected)
## with the PartnerApplication updated 