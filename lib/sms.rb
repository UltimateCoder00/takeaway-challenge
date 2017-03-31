require 'twilio-ruby'
require 'envyable'
Envyable.load('config/env.yml')

require 'twilio-ruby'

class SMS

  Account_sid = ENV["account_sid"]
  Auth_token = ENV["auth_token"]

  def initialize
    @client = Twilio::REST::Client.new Account_sid, Auth_token
  end

  def send(message)
    @client.messages.create(
      from: ENV["send_from"],
      to: ENV["send_to"],
      body: message
    )
  end
end
