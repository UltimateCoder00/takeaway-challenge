require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  let(:sms) { double(:sms, send: message) }
  let(:message) { "Thank you! Your order was placed and will be delivered before #{Time.new + 3600}" }

  let(:food) {"Cod"}
  let(:food2) {"Haddock"}
  let(:food3) {"Calamari"}
  let(:food4) {"Cod"}

  let(:food5) {"Pizza"}

  it '#show_menu' do
    expect(takeaway.show_menu).to eq takeaway.menu
  end

  describe '#show_basket' do
    it 'Display empty basket' do
      expect{takeaway.show_basket}.to raise_error "Your Basket is empty"
    end

    describe '#order' do
      it 'Display loaded basket' do
        takeaway.order(food, 1)
        takeaway.order(food2, 2)
        takeaway.order(food3, 1)
        takeaway.order(food4, 3)
        expect(takeaway.show_basket).to eq takeaway.basket
      end

      it 'order food not in menu' do
        expect{takeaway.order(food5, 1)}.to raise_error "Sorry '#{food5}' is not in our menu"
      end
    end
  end

  describe '#checkout' do
    it 'Confirm the basket total is correct' do
      takeaway.order(food, 1)
      takeaway.order(food2, 2)
      takeaway.order(food3, 1)
      takeaway.order(food4, 3)
      expect(takeaway.checkout).to eq nil
    end

    it 'The basket total is incorrect' do
      takeaway.order(food, 1)
      takeaway.order(food2, 2)
      takeaway.order(food3, 1)
      takeaway.order(food4, 3)
      expect(takeaway.checkout).to eq nil
    end
  end
end
