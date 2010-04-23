class Image < ActiveRecord::Base
  belongs_to :product
  
  has_many :image_type, :as => :imageable 

   has_attached_file :img, :styles => {:grid_1 => "45x45#" ,:grid_3 => "147x144#"},
     :url => "/uploads/:class/products/:product_id/:id/:style.:extension",
     :path => ":rails_root/public/uploads/:class/products/:product_id/:id/:style.:extension"

   validates_attachment_content_type :img, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']


   named_scope :by_product, lambda { |product| { 
                                     :joins => [:product],
                                     :conditions => ["images.product_id = ?", product]}}
                                     
   def dimension(url)
     Paperclip::Geometry.from_file(url)
   end
   
   def size(url)
      File.size(url)
   end
end
