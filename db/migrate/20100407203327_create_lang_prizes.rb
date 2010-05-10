class CreateLangPrizes < ActiveRecord::Migration
  def self.up
    create_table :lang_prizes do |t|
      t.string :name
      t.text :description
      t.references :prize
      t.references :language
      t.timestamps
    end
  end
  
  def self.down
    drop_table :lang_prizes
  end
end
