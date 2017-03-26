require 'csv'

class Menu
  attr_reader :food, :price, :list

  def initialize(food, price)
    @food = food
    @price = price
    @list = CSV.new(File.new(Dir.pwd + '/lib/menu_list.csv')).to_h
  end

  def add(food,price)
    @list["#{food}"] = "#{price}"
  end

  def remove(food)
    @list.delete("#{food}")
  end

end
