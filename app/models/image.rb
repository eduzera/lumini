class Image < ActiveRecord::Base
  belongs_to :product
  belongs_to :imageable, :polymorphic => true
  belongs_to :image_type

  accepts_nested_attributes_for :image_type

   has_attached_file :img, :styles => {:grid_1 => "45x45#", :grid_2 => "96x96#" ,:grid_3 => "147x144#", :grid_6 => "320x480#"},

     :url => "/uploads/:class/products/:product_id/:id/:style.:extension",
     :path => ":rails_root/public/uploads/:class/products/:product_id/:id/:style.:extension"

   validates_attachment_content_type :img, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']


   named_scope :by_product, lambda { |product, name| { 
                                     :joins => [:product, :image_type],
                                     :conditions => ["images.product_id = ? AND image_types.name = ?", product, name], 
                                     :order => 'image_types.name'}}
                                          
                                     
  named_scope :name_by_product, lambda { |product| { :select => "image_types.name 'name'", :joins => [:image_type], :conditions => ['images.product_id = ?', product], 
    :group => 'image_types.id'  }}
    
                                     
                                     
                                     
                                     
  named_scope :name_by_product, lambda { |product| { :select => "image_types.name 'name'", :joins => [:image_type], :conditions => ['images.product_id = ?', product], 
    :group => 'image_types.id'  }}
                                     
   def dimension(url)
     Paperclip::Geometry.from_file(url)
   end
   
   def size(url)
      File.size(url)
   end
end
