class Prize < ActiveRecord::Base

  has_many :lang_prize
  
  has_many :product_prize
  
  def to_label
    "#{lang_prize.first.name}"
  end
  
end
