require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACbe440c526efb95ce266530123d7270ea'
auth_token = 'd2ddb13e5a51c71629ecf387788aef8d'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# alternatively, you can preconfigure the client like so
# Twilio.configure do |config|
#   config.account_sid = account_sid
#   config.auth_token = auth_token
# end
#
# # and then you can create a new client without parameters
# @client = Twilio::REST::Client.new


@client.messages.create(
  from: '+441570400038',
  to: '+447554457999',
  body: 'Hey there!'
)
