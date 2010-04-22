class Designer < ActiveRecord::Base
  has_one :product
  has_many :lang_designer
  
  named_scope :by_product, lambda { |product| {
                                :joins => [:product],
                                :conditions => ["products.id = ?", product]}}
                                
                                
  named_scope :by_language, lambda { |language| {
                                :select => "designers.id 'id', designers.name 'name', lang_designers.biography 'bio', 
                                            designers.birthdate 'birthdate', designers.deathdate 'deathdate'",
                                :joins => {:lang_designer => [:language]},
                                :conditions => ["languages.abbr = ?", language]}}
                        
end

