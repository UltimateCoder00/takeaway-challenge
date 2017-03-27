require_relative 'menu'
require_relative 'sms'

class Takeaway

  attr_reader :menu, :sms, :basket

  def initialize(menu_class: Menu.new, sms_service: SMS.new)
    @menu = menu_class.list
    @sms = sms_service
    @basket = {}
  end

  def show_menu
    display(menu)
  end

  def show_basket
    display(basket)
  end

  def order(food, quantity)
    fail "Sorry '#{food}' is not in our menu" unless @menu.has_key?("#{food}")
    if @basket.has_key?("#{food}")
      @basket["#{food}"] += (@menu["#{food}"].to_f * quantity)
    else
      @basket["#{food}"] = (@menu["#{food}"].to_f * quantity)
    end

    puts "#{quantity} '#{food}' has been added to your basket"
  end

  def checkout
    display(basket)

    unless basket.empty?
      max_length = 0
      spacing = 5

      sum = 0

      basket.each do |food, price|
         sum += price.to_f
         max_length = food.length if max_length <= food.length
      end

      puts "*"*(max_length * 2 + spacing)
      puts "Total:".ljust(max_length + spacing) + "£#{'%.2f' % sum}"

      confirmation
    end
  end

  private

  def display(list)
    fail "Your Basket is empty" if list.empty?

    max_length = 0
    spacing = 5

    list.each do |food, price|
       max_length = food.length if max_length <= food.length
    end

    puts "Dish".ljust(max_length + spacing) +  "Price"
    puts "*"*(max_length * 2 + spacing)

    list.each do |food, price|
      puts food.to_s.ljust(max_length + spacing) + "£" + ('%.2f' % price.to_s)
    end
  end

  def confirmation
    while true
      puts "Is this order correct? (Y/N)"
      reply = gets.chomp

      if reply.upcase == 'Y'
        puts "Thank your for ordering with us, you will shortly receive a confirmation text message"
        send_sms
        break
      elsif reply.upcase == 'N'
        puts "Your order is cancelled"
        @basket.clear
        break
      else
        next
      end
    end
  end

  def send_sms
    message = "Thank you! Your order was placed and will be delivered before #{Time.new + 3600}"
    # sms.send(message)
  end

end
