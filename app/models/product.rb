class Product < ActiveRecord::Base
  belongs_to :designer
  belongs_to :manufacture
  belongs_to :category
  belongs_to :family
  
  has_many :images, :as => :imageable, :dependent => :destroy
  has_many :lang_product
  has_many :product_prize
 
  accepts_nested_attributes_for :lang_product
  #accepts_nested_attributes_for :images

  named_scope :all_with_filter, :select => "products.id 'id', lang_products.name 'name', lang_products.description 'description', 
                                            lang_products.tech_description 'tech_description', lang_categories.name 'category_name', 
                                            lang_families.name 'family_name'",
                                :joins => [:images, {:category => [:lang_category], :family => [:lang_family],  :lang_product => [:language]}], 
                                :group => "products.id"


  named_scope :active , :conditions => ['products.status = ?', true]

  named_scope :by_language, lambda { |language| {
                                :joins => {:lang_product => [:language]},
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
                                    
                                    
  named_scope :by_prize, lambda { |prize| { 
                                    :select => "products.id 'id', lang_products.name 'name', product_prizes.year 'year'",
                                    :joins => [:lang_product, :product_prize],
                                    :conditions => ["product_prizes.prize_id = ?", prize], 
                                    :group => "id",
                                    :order => "product_prizes.year"}}

  after_update :save_prizes
  
   def new_product_prize_attributes=(prize_attributes)
     prize_attributes.each do |attributes|
       product_prize.build(attributes)
     end
   end
   
   def existing_product_prize_attributes=(prize_attributes)
     product_prize.reject(&:new_record?).each do |prize|
       attributes = prize_attributes[prize.id.to_s]
       if attributes
         prize.attributes = attributes
       else
         product_prize.delete(prize)
       end
     end
   end
   
   
   def save_prizes
     product_prize.each do |prize|
       prize.save(false)
     end
   end
                                                                 
                                    
  def new_lang_product_attributes=(product_attributes)
    product_attributes.each do |attributes|
      lang_product.build(attributes)
    end
  end

  
  def existing_lang_product_attributes=(product_attributes)
    lang_product.reject(&:new_record?).each do |lang|
      attributes = product_attributes[lang.id.to_s]
      if attributes
        lang.attributes = attributes
      else
        lang_product.delete(lang)
      end
    end
  end
  
end