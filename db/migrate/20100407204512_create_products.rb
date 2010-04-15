class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.boolean :status
      t.references :designer
      t.references :manufacture
      t.references :prize
      t.references :category
      t.references :family
      t.timestamps
    end
  end
  
  def self.down
    drop_table :products
  end
end
