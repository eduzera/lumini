class ProductPrize < ActiveRecord::Base
  belongs_to :product
  belongs_to :prize
  
  validates_presence_of     :year
  validates_length_of       :year, :minimum => 2 
  validates_numericality_of :year
  
  #validates_uniqueness_of :year, :scope => :product_id,  :message => "pode ser atribuido 1 vez ao Produto." 
  
end
