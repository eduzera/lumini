class CreateDesigners < ActiveRecord::Migration
  def self.up
    create_table :designers do |t|
      t.string :name
      t.datetime :birthdate
      t.datetime :deathdate, :defaults => nil
      t.timestamps
    end
  end
  
  def self.down
    drop_table :designers
  end
end
