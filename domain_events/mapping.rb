DomainEvents::Publishing.configure do |publisher|
  publisher.add_reaction('RejectedPartnerApplication', CreditSituationRejected)
end

# Configure all events that are notifying in the application

# RejectedPartnerApplication = It is an event
# CreditSituationRejected    = It is an observee