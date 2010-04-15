class CreatePrizes < ActiveRecord::Migration
  def self.up
    create_table :prizes do |t|
      t.boolean :status, :default => true
      t.timestamps
    end
  end
  
  def self.down
    drop_table :prizes
  end
end
