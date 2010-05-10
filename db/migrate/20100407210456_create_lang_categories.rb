class CreateLangCategories < ActiveRecord::Migration
  def self.up
    create_table :lang_categories do |t|
      t.string :name
      t.text :description
      t.references :category
      t.references :language
      t.timestamps
    end
  end

  def self.down
    drop_table :lang_categories
  end
end
