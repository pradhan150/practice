require 'pry-nav'

class AssignInput
  def place_orders
    puts 'numbers of orders : '
    total_orders = gets.chomp.to_i
    order_string = []

    (0...total_orders).each do |i|
      order_string[i] = gets.chomp
    end

    order_string
  end
end

class ProductAttributes
  def initialize(order)
    @order = order.to_s
    @order_arr = order.split(' ')
    @quantity = 0
    @basic = true
    @imported = false
    @price = 0
  end

  def find_quantity
    @quantity = @order_arr[0]

    @quantity
  end

  def basic?
    if @order.include?('book')
      @basic = false
    elsif @order.include?('chocolate')
      @basic = false
    elsif @order.include?('pill')
      @basic = false
    else
      @basic = true
    end
  end

  def imported?
    if @order.include?('imported')
      @imported = true
    end

    @imported
  end

  def find_price
    @price = @order_arr[-1]

    @price
  end

  def find_order_arr
    @order_arr
  end
end

class CaluculateTaxes

  def initialize(basic, quantity, price, imported)
    @basic = basic
    @quantity = quantity.to_f
    @price = price.to_f
    @imported = imported
    @basic_tax = 0.00
    @import_tax = 0.00
    @salex_tax = 0.00
    @total_price = 0.00
  end

  def calculate_basic_tax
    return @basic_tax unless @basic

    @basic_tax = @price * 0.1 * @quantity
  end

  def calculate_imported_tax
    if @imported
      @import_tax = @price * 0.05 * @quantity
    end

    @import_tax
  end

  def calculate_sales_tax
    @salex_tax = @basic_tax + @import_tax

    # conversion is still  left
    @salex_tax = 0.05 * (@salex_tax / 0.05).round
  end

  def calculate_total_price
    @total_price = @price.to_f + @salex_tax

    @total_price
  end
end

ap = AssignInput.new
order_string = ap.place_orders

total_order_sales_tax = 0
total_order_price = 0

order_string.each do |i|
  pa = ProductAttributes.new(i)
  quantity = pa.find_quantity
  basic = pa.basic?
  imported = pa.imported?
  price = pa.find_price
  order_arr = pa.find_order_arr

  ct = CaluculateTaxes.new(basic, quantity, price, imported)
  ct.calculate_basic_tax
  ct.calculate_imported_tax
  salex_tax = ct.calculate_sales_tax
  total_price = ct.calculate_total_price

  total_order_sales_tax += salex_tax
  total_order_price += total_price

  puts "#{order_arr[0..-3].join(' ')}: #{total_price.round(2)}"
end

puts "Sales Taxes: #{total_order_sales_tax.round(2)}"
puts "Total: #{total_order_price.round(2)}"
