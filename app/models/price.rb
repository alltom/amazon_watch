class Price < ActiveRecord::Base
  belongs_to :product
  
  before_validation_on_create :set_default_observation_date
  
  validates_associated :product
  validates_presence_of :product
  validates_presence_of :price
  validates_presence_of :observation_date
  
  def set_default_observation_date
    self.observation_date ||= Time.now
  end
  
  # if passed a copy-paste from Amazon's "price change,"
  # finds products and inserts Prices
  def self.batch_update price_text, observation_date=Time.now
    updated = []
    Price.transaction do
      price_text = price_text.gsub(/\r?\n/, "|").gsub("||", "\n").gsub("|", " ")
      price_text.scan(/price of (.+) has .+ from \$(.+) to \$(.+) since you/) do |item, oldprice, newprice|
        puts "got #{item}"
        product = Product.find_by_name(item) || Product.new(:name => item)
        price = Price.new(:product => product, :price => newprice)
        price.save!
        updated << product
      end
    end
    updated
  rescue ActiveRecord::RecordInvalid => invalid
    false
  end
end
