require './order_processor.rb'

class Order
  def initialize
    @order_items = []
  end

  def place_orders
    puts 'numbers of orders : '
    numbers_of_orders = gets.chomp.to_i
    numbers_of_orders.times { @order_items << gets.chomp }

    @order_items
  end
end

order_items = Order.new.place_orders
processor = OrderProcessor.new(order_items)
processor.print_reciept
