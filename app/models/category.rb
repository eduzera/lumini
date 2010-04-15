class Category < ActiveRecord::Base
  has_many :product
  has_many :lang_category
                    
                    
  named_scope :all_with_filter, :select => "lang_categories.id 'id', lang_categories.name 'name'", 
                                :joins => [:lang_category], 
                                :order => "lang_categories.name", 
                                :group => "categories.id"
                    
                    
  named_scope :active,  :include => [:product], 
                        :conditions => ["products.category_id = categories.id"], 
                        :group => "categories.id"   
                        
                        
  named_scope :info, lambda { |category| {
                                  :select => "lang_categories.id 'id', lang_categories.name 'name'", 
                                  :joins => [:lang_category], 
                                  :conditions => ["categories.id = ?", category],
                                  :group => "categories.id"}}
  
  def to_label
    "#{lang_category.first.name}"
  end
end
