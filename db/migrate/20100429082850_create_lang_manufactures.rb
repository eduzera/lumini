class CreateLangManufactures < ActiveRecord::Migration
  def self.up
    create_table :lang_manufactures do |t|
      t.string :name
      t.references :manufacture
      t.references :language
      t.timestamps
    end
  end

  def self.down
    drop_table :lang_manufactures
  end
end
