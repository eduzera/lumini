class Product < ActiveRecord::Base
  belongs_to :designer
  belongs_to :manufacture
  belongs_to :prize
  belongs_to :category
  belongs_to :family
  
  has_many :image, :dependent => :destroy
  has_many :lang_product
 
  accepts_nested_attributes_for :lang_product
  accepts_nested_attributes_for :image
 
  cattr_reader :per_page
  @@per_page = 5
  


  named_scope :all_with_filter, :select => "products.id 'id', lang_products.name 'name', lang_products.description 'description', 
                                            lang_products.tech_description 'tech_description', lang_categories.name 'category_name', 
                                            lang_families.name 'family_name'",
                                :joins => {:category => [:lang_category], :family => [:lang_family],  :lang_product => [:language]}, 
                                :group => "products.id"


  named_scope :by_language, lambda { |language| {
                                :select => "products.id 'id', lang_products.name 'name', lang_products.description 'description', 
                                            lang_products.tech_description 'tech_description', lang_categories.name 'category_name', 
                                            lang_families.name 'family_name'",
                                :joins => {:category => [:lang_category], :family => [:lang_family],  :lang_product => [:language]},
                                :conditions => ["languages.abbr = ?", language]}}

  
  named_scope :by_family, lambda { |family| {
                                :select => "products.id 'id', lang_products.name 'name'",
                                :joins => [:family, :lang_product],
                                :conditions => ["products.family_id = ?", family], 
                                :group => "products.id"}}
  
  
  named_scope :by_category, lambda { |category| { 
                                  :select => "products.id 'id', lang_products.name 'name'",
                                  :joins => [:lang_product],
                                  :conditions => ["products.category_id = ?", category]}}
                                    
  named_scope :by_manufacture, lambda { |manufacture| { 
                                    :select => "products.id 'id', lang_products.name 'name'",
                                    :joins => [:lang_product],
                                    :conditions => ["products.manufacture_id = ?", manufacture]}}
end
