module TaxCalculator
  def tax
    tax = 0.00
    tax += basic_tax unless exempted?
    tax += imported_tax if imported?

    round_off(tax)
  end

  def basic_tax
    price.to_f * 0.1 * quantity.to_f
  end

  def imported_tax
    price.to_f * 0.05 * quantity.to_f
  end

  def round_off(sales_tax)
    0.05 * (sales_tax / 0.05).round
  end
end
