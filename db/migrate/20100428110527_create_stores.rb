class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string :email
      t.string :telephone
      t.string :operation
      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
