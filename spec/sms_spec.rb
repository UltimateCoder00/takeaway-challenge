require 'sms'

describe SMS do
  let(:sms) {double :SMS, send: true}

  message = "Hello there."

  describe '#send' do
    it 'Send SMS message' do
      expect(sms.send(message)).to eq true
    end
  end
end
