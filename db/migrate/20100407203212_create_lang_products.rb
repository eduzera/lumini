class CreateLangProducts < ActiveRecord::Migration
  def self.up
    create_table :lang_products do |t|
      t.string :name
      t.text :description
      t.text :tech_description
      t.references :product
      t.references :language
      t.timestamps
    end
  end

  def self.down
    drop_table :lang_products
  end
end
