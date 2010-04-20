class ProductPrize < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :prize
  
  validates_presence_of     :year
  validates_length_of       :year, :minimum => 2 
  validates_numericality_of :year
  
end
