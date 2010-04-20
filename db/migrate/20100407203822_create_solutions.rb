class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.boolean :status, :default => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :solutions
  end
end
