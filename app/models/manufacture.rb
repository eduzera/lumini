class Manufacture < ActiveRecord::Base
  has_many :product
  
  named_scope :active,  :include => [:product], 
                        :conditions => ["products.manufacture_id = manufactures.id"], 
                        :group => "manufactures.id"
end
