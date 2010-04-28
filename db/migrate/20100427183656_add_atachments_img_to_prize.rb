class AddAtachmentsImgToPrize < ActiveRecord::Migration
  def self.up
    add_column :prizes, :img_file_name,     :string
    add_column :prizes, :img_content_type,  :string
    add_column :prizes, :img_file_size,     :integer
    add_column :prizes, :img_updated_at,    :datetime
  end

  def self.down    
    add_column :prizes, :img_file_name
    add_column :prizes, :img_content_type
    add_column :prizes, :img_file_size   
    add_column :prizes, :img_updated_at  
  end
end
