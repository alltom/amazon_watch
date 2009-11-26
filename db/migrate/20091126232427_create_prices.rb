class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.integer :product_id
      t.decimal :price
      t.datetime :observation_date
      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
