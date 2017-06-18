require_relative 'partner_application'

partner = PartnerApplication.new(1, 'Partner Bank XPTO')

puts "\nPartnerApplication#reject output: #{partner.reject.inspect}"
puts "\nPartnerApplication before #reject: #{partner.inspect}"

