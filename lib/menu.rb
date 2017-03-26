require 'csv'

class Menu
  attr_reader :food, :price, :list

  def initialize(food, price)
    @food = food
    @price = price
    @list
  end

  def load_list
    file_path = Dir.pwd + '/lib/menu_list.csv'

    file = File.new(file_path)
    @list = CSV.read(file)
  end
end
