class AddNacionalityToDesigner < ActiveRecord::Migration
  def self.up
    add_column :lang_designers, :nacionality, :string
  end

  def self.down
    remove_column :lang_designers, :nacionality
  end
end
