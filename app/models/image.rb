class Image < ActiveRecord::Base
  belongs_to :product

   has_attached_file :img, :styles => {:grid_1 => "45x45>" ,:grid_3 => "147x144>"},
     :url => "/uploads/:class/:id/:style.:extension",
     :path => ":rails_root/public/uploads/:class/:id/:style.:extension"
  
  
   validates_attachment_content_type :img, :content_type => ['image/jpeg', 'image/png', 'ímage/jpg']


   named_scope :by_product, lambda { |product| { 
                                     :joins => [:product],
                                     :conditions => ["images.product_id = ?", product]}}
end
