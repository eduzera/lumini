class Family < ActiveRecord::Base
  has_many :product
  has_many :lang_family
  
  def to_label
    "#{lang_family.first.name}"
  end
  
  accepts_nested_attributes_for :lang_family
  
  named_scope :by_category, lambda {| category, language |{
                            :select => "families.id 'id', lang_families.name 'name', manufactures.id 'product_manufacture_id', lang_manufactures.name 'product_manufacture'",
                            :joins => [:lang_family, {:product => [:category, {:manufacture => [:lang_manufacture], :lang_product => [:language]}]}],
                            :conditions => ["products.family_id = families.id AND products.status = ? AND categories.id = ?
                                            AND languages.abbr = ?", true, category, language], 
                            :group => "families.id, lang_families.name"}}  

  named_scope :by_manufacture, lambda {| manufacture, language |{
                            :select => "families.id 'id', lang_families.name 'name', manufactures.id 'product_manufacture_id', lang_manufactures.name 'product_manufacture'",
                            :joins => [:lang_family, {:product => [:category, {:manufacture => [:lang_manufacture], :lang_product => [:language]}]}],
                            :conditions => ["products.family_id = families.id AND products.status = ? AND manufactures.id = ?
                                            AND languages.abbr = ?", true, manufacture, language], 
                            :group => "families.id, lang_families.name"}}  


  
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
                                
  
#   named_scope :product_by_family_and_category, 
#                 lambda { |category| {
#                   :select => "lang_families.id 'id', lang_families.name 'name', 
#                               lang_categories.id 'product_category_id', lang_categories.name 'product_category'",
#                   :joins => [:lang_family, {:product => [{:category => :lang_category}]}],
#                   :conditions => ["products.category_id = ?", category], 
#                   :group => "id"}}
                   
                   
#   named_scope :product_by_family_and_manufacture, 
#                 lambda { |manufacture| {
#                   :select => "lang_families.id 'id', lang_families.name 'name', 
#                               products.id 'product_id', manufactures.id 'product_manufacture_id', lang_manufactures.name 'product_manufacture'",
#                   :joins => [:lang_family, {:product => {:manufacture => [:lang_manufacture]}}],
#                   :conditions => ["products.manufacture_id = ?", manufacture], 
#                   :group => "id, products.id"}}
                   
   after_update :save_languages

   def new_lang_family_attributes=(family_attributes)   
     family_attributes.each do |attributes|
       lang_family.build(attributes)
     end
   end

   def existing_lang_family_attributes=(family_attributes)
     lang_family.reject(&:new_record?).each do |lang|
       attributes = family_attributes[lang.id.to_s]
       if attributes
         lang.attributes = attributes
       else
         lang_family.delete(lang)
       end
     end
   end

   def save_languages
     lang_family.each do |lang|
       lang.save(false)
     end
   end
  
end



