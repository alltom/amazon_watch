module ProductsHelper
  def min_price_diff_or_blank product
    diff = (product.min_price - product.current_price)
    diff == 0 ? "" : diff.to_s
  end
  
  def max_price_diff_or_blank product
    diff = (product.max_price - product.current_price)
    diff == 0 ? "" : "+" + diff.to_s
  end
end
