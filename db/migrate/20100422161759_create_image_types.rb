class CreateImageTypes < ActiveRecord::Migration
  def self.up
    create_table :image_types do |t|
      t.string :name
      t.string :model_name
      t.timestamps
    end
  end

  def self.down
    drop_table :image_types
  end
end
