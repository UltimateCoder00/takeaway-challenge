require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  let(:food) {:food}
  let(:price) {:food_price}

  describe 'Print menu' do
    it '#list' do
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

    it 'Removing item that does not exist in the list' do
      expect(menu.remove(food)).to eq nil
    end
  end
end
