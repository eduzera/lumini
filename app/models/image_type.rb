class ImageType < ActiveRecord::Base
  has_many :image
  
  named_scope :all_with_filter, 
          lambda { |mymodel| {  
            :conditions => ["model_name = ?", mymodel]
          }}
end
