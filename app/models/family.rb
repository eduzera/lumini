class Family < ActiveRecord::Base
  has_many :product
  has_many :lang_family
  
  def to_label
    "#{lang_family.first.name}"
  end
  
  named_scope :all_with_filter, :select => "families.id 'id', lang_families.name 'name'",
                            :joins => [:lang_family]
  
 # named_scope :product_by_family_and_category, 
 #              lambda { |category| {
 #              :joins => [:lang_family, {:product => [{:category => :lang_category}, :lang_product]}],
 #                :conditions => ["products.category_id = ?", category]}}


####################################################################################################################################

  # named_scope :product_by_family_and_category_OK, 
  #               lambda { |category| {
  #                 :select => "families.id 'family_id', lang_families.name 'family_name', lang_products.*",
  #                 :joins => [:lang_family, {:product => :lang_product}], 
  #                 :conditions => ["category_id = ?", category], :group => "family_id"}}
              
              
  # named_scope :product_by_family_and_category_OK_Category, 
  #               lambda { |category| {
  #                 :select => " lang_products.*, lang_families.name 'family_name', lang_categories.name 'category_name'",
  #                 :joins => [:lang_family, {:product => :lang_product}, {:product => [:category => :lang_category] }],
  #                 :conditions => ["products.category_id = ?", category], :group => "products.family_id"}}
                                
  
   named_scope :product_by_family_and_category, 
                 lambda { |category| {
                   :select => "lang_families.id 'id', lang_families.name 'name', 
                               lang_categories.id 'product_category_id', lang_categories.name 'product_category'",
                   :joins => [:lang_family, {:product => [{:category => :lang_category}]}],
                   :conditions => ["products.category_id = ?", category], 
                   :group => "id"}}
                   
                   
   named_scope :product_by_family_and_manufacture, 
                 lambda { |manufacture| {
                   :select => "lang_families.id 'id', lang_families.name 'name', 
                               manufactures.id 'product_manufacture_id', manufactures.name 'product_manufacture'",
                   :joins => [:lang_family, {:product => [:manufacture]}],
                   :conditions => ["products.manufacture_id = ?", manufacture], 
                   :group => "id"}}
  
end



