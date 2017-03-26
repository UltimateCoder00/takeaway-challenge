require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu_class) {Menu.new(nil,nil)}

  it '#display_menu' do
    expect(takeaway.display_menu).to eq menu_class.load_list
  end
end
