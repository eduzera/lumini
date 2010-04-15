class CreateLangSolutions < ActiveRecord::Migration
  def self.up
    create_table :lang_solutions do |t|
      t.string :name
      t.string :description
      t.references :solution
      t.references :language
      t.timestamps
    end
  end

  def self.down
    drop_table :lang_solutions
  end
end
