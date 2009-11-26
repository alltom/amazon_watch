class Price < ActiveRecord::Base
  belongs_to :product
  
  validates_presence_of :product
  validates_presence_of :price
  validates_presence_of :observation_date
end
