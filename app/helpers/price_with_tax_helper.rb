module PriceWithTaxHelper
  def price_with_tax(price)
    (price.to_i * 1.08).to_i
  end
end