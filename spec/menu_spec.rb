require 'menu'

describe Menu do
  subject(:menu) {described_class.new(food, price)}

  let(:food) {:food}
  let(:price) {:food_price}

  describe 'Check Menu' do
    it '#food' do
      expect(menu.food).to eq food
    end

    it '#price' do
      expect(menu.price).to eq price
    end
  end

  describe 'Print menu' do
    it '#print' do
      expect(menu.load).to eq menu.list
    end
  end
end
