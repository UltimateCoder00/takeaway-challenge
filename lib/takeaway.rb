require_relative 'menu'

class Takeaway

  attr_reader :menu_class

  def initialize(menu_class: Menu.new(nil,nil))
    @menu_class = menu_class
    @menu_list
  end

  def display_menu
    menu_list = menu_class.load_list


    max_length = 0
    menu_list.each do |food, price|
      max_length = food.length if max_length <= food.length
    end

    counter = 1
    spacing = 4

    puts "No".to_s.ljust(spacing) + "Food".ljust(max_length + spacing) + "Price"
    puts "*"*(max_length*(spacing / 2 ))
    menu_list.each do |food, price|
      puts counter.to_s.ljust(spacing) + food.to_s.ljust(max_length + spacing) + "£" + price
      counter += 1
    end

  end
end
