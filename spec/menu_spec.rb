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
    it '#load_list' do
      expect(menu.list).to eq menu.list
    end
  end

  describe 'Add food to menu' do
    it '#add' do
      expect(menu.add(food, price)).to eq "#{price}"
    end
  end

  describe 'Remove food from menu' do
    it '#remove' do
      menu.add(food, price)
      expect(menu.remove(food)).to eq "#{price}"
    end
  end
end
