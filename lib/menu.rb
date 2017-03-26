require 'csv'

class Menu

  attr_reader :list

  def initialize
    @list = CSV.new(File.new(Dir.pwd + '/lib/menu_list.csv')).to_h
  end

  def add(food,price)
    !@list.has_key?("#{food}") ? append(food,price) : change(food,price)
  end

  def remove(food)
    fail "Error: The food item you provided does not exist in the menu list" unless exists?(food)
    @list.delete("#{food}")
    puts "'#{food}' has been removed from the menu list"
  end

  def update
    File.open(Dir.pwd + "/lib/menu_list(updated).csv", "w") do |file|
      @list.each do |key, value|
        file.write("#{key}")
        file.write(',')
        file.write("#{value}")
        file.write "\n"
      end
    end
  end

  private

  def change(food,price)
    old_price = @list["#{food}"]
    @list["#{food}"] = "#{price}"
    puts "'#{food}'s' price has been changed from £#{'%.2f' % old_price.to_f} to £#{'%.2f' % @list["#{food}"].to_f} in the menu list"
  end

  def append(food,price)
    @list["#{food}"] = "#{price}"
    puts "'#{food}' costing £#{'%.2f' % @list["#{food}"].to_f}, has been added to the menu list"
  end

  def exists?(food)
    @list.has_key?("#{food}")
  end

end
