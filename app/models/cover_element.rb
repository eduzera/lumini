class CoverElement < ActiveRecord::Base
  
  belongs_to :cover
  belongs_to :product
  
end
