class CoverElement < ActiveRecord::Base
  
  belongs_to :cover
  belongs_to :product
  
  named_scope :by_product, lambda { |product_id| {:conditions => ["product_id = ?", product_id]}}
  
end
