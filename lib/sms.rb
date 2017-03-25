require 'twilio-ruby'

class SMS

  Account_sid = 'ACbe440c526efb95ce266530123d7270ea'
  Auth_token = 'd2ddb13e5a51c71629ecf387788aef8d'

  def initialize
    @client = Twilio::REST::Client.new Account_sid, Auth_token
  end

  def send(message)
    @client.messages.create(
      from: '+441570400038',
      to: '+447554457999',
      body: message
    )
  end
end
