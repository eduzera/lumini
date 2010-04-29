class CreateLangStores < ActiveRecord::Migration
  def self.up
    create_table :lang_stores do |t|    
      t.string :title
      t.string :city
      t.string :state
      t.string :street
      t.string :neighborhood
      t.string :postal_code
      t.references :store
      t.references :language

      t.timestamps
    end
  end

  def self.down
    drop_table :lang_stores
  end
end
