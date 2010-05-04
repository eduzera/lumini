class Language < ActiveRecord::Base
  has_many :lang_category
  has_many :lang_designer
  has_many :lang_family
  has_many :lang_prize
  has_many :lang_product
  has_many :lang_solution
  
  validates_presence_of :name, :abbr
  
end


