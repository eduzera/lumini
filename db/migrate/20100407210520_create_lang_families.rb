class CreateLangFamilies < ActiveRecord::Migration
  def self.up
    create_table :lang_families do |t|
      t.string :name
      t.string :description
      t.references :family
      t.references :language
      t.timestamps
    end
  end

  def self.down
    drop_table :lang_families
  end
end
