class AddPriorityToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :priority, :integer
  end

  def self.down
    remove_column :images, :priority, :integer
  end
end
