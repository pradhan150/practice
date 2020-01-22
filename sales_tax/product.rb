require './tax_calculator'

class Product
  include TaxCalculator
  attr_reader :item_detail

  EXEMPTED_PRODUCTS = %w[book chocolate pill].freeze

  def initialize(item_detail)
    @item_detail = item_detail
  end

  def name
    details[1..-3].join(' ').gsub('imported ', '')
  end

  def price
    details[-1]
  end

  def quantity
    details[0]
  end

  def exempted?
    EXEMPTED_PRODUCTS.any? { |item| name.include?(item) }
  end

  def imported?
    item_detail.include?('imported')
  end

  def total_price
    quantity.to_f * price.to_f + tax.to_f
  end

  private

  def details
    @details ||= item_detail.split(' ')
  end
end
