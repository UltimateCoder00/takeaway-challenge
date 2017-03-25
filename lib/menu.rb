require 'csv'

class Menu
  attr_reader :food, :price, :list

  def initialize(food, price)
    @food = food
    @price = price
    @list
  end

  def print

    file_path = Dir.pwd + '/lib/menu_list.csv'

    file = File.new(file_path)
    @list = CSV.read(file)

    max_length = 0
    list.each do |food, price|
      max_length = food.length if max_length <= food.length
    end

    counter = 1
    spacing = 4

    puts "No".to_s.ljust(spacing) + "Food".ljust(max_length + spacing) + "Price"
    puts "*"*(max_length*(spacing / 2 ))
    list.each do |food, price|
      puts counter.to_s.ljust(spacing) + food.to_s.ljust(max_length + spacing) + "£" + price
      counter += 1
    end
  end
end
