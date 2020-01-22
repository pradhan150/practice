require './product.rb'

class OrderProcessor
  attr_accessor :products

  def initialize(order_items)
    products = []
    order_items.each do |item_detail|
      products.push(Product.new(item_detail))
    end

    @products = products
  end

  def total_order_price
    @products.inject(0) { |sum, product| sum + product.total_price }
  end

  def total_sales_tax
    @products.inject(0) { |sum, product| sum + product.tax }
  end

  def print_reciept
    products.each do |product|
      result = product.quantity.to_s
      result += ' imported ' if product.imported?
      result += " #{product.name}: #{product.total_price.round(2)}"
      puts result
    end

    puts "Sales Taxes: #{total_sales_tax.round(2)}"
    puts "Total: #{total_order_price.round(2)}"
  end
end
