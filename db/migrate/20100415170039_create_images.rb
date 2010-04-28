class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.references :status, :default => false
      t.references :product
      t.references :imageable, :polymorphic => true
      t.references :image_type
      t.timestamps
    end
  end
  
  def self.down
    drop_table :images
  end
end
