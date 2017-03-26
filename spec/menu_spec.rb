require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  let(:food) {:food}
  let(:price) {:food_price}

  let(:food2) {"Cod"}
  let(:price2) {"5.00"}

  describe '#list' do
    it 'Print menu' do
      expect(menu.list).to eq menu.list
    end
  end

  describe '#add' do
    it 'Add new food to menu' do
      expect(menu.add(food, price)).to eq nil
    end

    it 'Change existing foods price in menu' do
      expect(menu.add(food2, price2)).to eq nil
    end
  end

  describe '#remove' do
    it 'Remove existing food from menu' do
      menu.add(food, price)
      expect(menu.remove(food)).to eq nil
    end

    it 'Removing food item that does not exist in the list' do
      expect{menu.remove(food)}.to raise_error "Error: The food item you provided does not exist in the menu list"
    end
  end

  describe '#update' do
    it 'Update menu list file' do
      expect(menu.update).to eq menu.list
    end
  end
end
