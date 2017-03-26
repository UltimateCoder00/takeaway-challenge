require_relative 'menu'

class Takeaway

  attr_reader :show_menu, :basket, :sms

  def initialize(menu_class: Menu.new, sms_service: SMS.new)
    @show_menu = menu_class.list
    @sms = sms_service
    @basket = {}
  end

  def order(food)
    if @basket.has_key?("#{food}")
      @basket["#{food}"] += @show_menu["#{food}"].to_f
    else
      @basket["#{food}"] = @show_menu["#{food}"].to_f
    end

    puts "Your current basket has: #{basket}"
  end

  def checkout
    while true
      puts @basket
      sum = 0
      basket.each { |key, value| sum += value }
      puts "Your current balance is: £#{'%.2f' % sum}"
      puts "Please confirm your order is correct (Y/N)"
      reply = gets.chomp

      if reply.upcase == 'Y'
        puts "You will shortly receive a confirmation text message for your order"
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
    message = "Your order will be with you soon"
    # sms.send(message)
  end

end
