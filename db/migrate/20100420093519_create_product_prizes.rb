class CreateProductPrizes < ActiveRecord::Migration
  def self.up
    create_table :product_prizes do |t|
      t.references :product
      t.references :prize
      t.integer    :year
      t.timestamps
    end
  end

  def self.down
    drop_table :product_prizes
  end
end
