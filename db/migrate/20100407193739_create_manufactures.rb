class CreateManufactures < ActiveRecord::Migration
  def self.up
    create_table :manufactures do |t|
      t.string :website
      t.boolean :status, :default => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :manufactures
  end
end
