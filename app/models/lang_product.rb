class LangProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :language
  
  validates_uniqueness_of :product_id, :scope => :language_id
end
