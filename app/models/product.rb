class Product < ActiveRecord::Base
  has_many :prices, :dependent => :destroy
  
  validates_presence_of :name
  
  def current_price
    prices.find(:first, :order => "observation_date DESC").price
  end
  
  def average_price
    prices.average(:price)
  end
  
  def min_price
    prices.minimum(:price)
  end
  
  def max_price
    prices.maximum(:price)
  end
  
  def <=>(product)
    if current_price - max_price == product.current_price - product.max_price
      (current_price - min_price) <=> (product.current_price - product.min_price)
    else
      (current_price - max_price) <=> (product.current_price - product.max_price)
    end
  end
end
