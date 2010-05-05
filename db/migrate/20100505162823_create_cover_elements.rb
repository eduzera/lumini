class CreateCoverElements < ActiveRecord::Migration
  def self.up
    create_table :cover_elements do |t|
      
      t.references :cover
      t.references :product
      t.string     :grid_size
      t.integer    :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :cover_elements
  end
end
