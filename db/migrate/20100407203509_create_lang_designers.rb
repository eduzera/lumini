class CreateLangDesigners < ActiveRecord::Migration
  def self.up
    create_table :lang_designers do |t|
      t.text :biography
      t.references :designer
      t.references :language
      t.timestamps
    end
  end
  
  def self.down
    drop_table :lang_designers
  end
end
