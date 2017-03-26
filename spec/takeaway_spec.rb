require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  let(:sms) { double(:sms, send: message) }
  let(:message) { "Your order will be with you soon" }

  let(:food) {"Cod"}
  let(:food2) {"Haddock"}
  let(:food3) {"Calamari"}
  let(:food4) {"Cod"}

  it '#order' do
    expect(takeaway.order(food)).to eq nil
  end

  it '#checkout' do
    takeaway.order(food)
    takeaway.order(food2)
    takeaway.order(food3)
    takeaway.order(food4)
    expect(takeaway.checkout).to eq nil
  end
end
