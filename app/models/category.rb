class Category < ActiveRecord::Base
  has_many :product
  has_many :lang_category
  
  accepts_nested_attributes_for :lang_category
                    
                    
  named_scope :all_with_filter, :select => "lang_categories.id 'id', lang_categories.name 'name'", 
                                :joins => [:lang_category], 
                                :order => "lang_categories.name", 
                                :group => "categories.id"
                    
                    
  named_scope :active, lambda {|language| { :include => {:product => {:lang_product => [:language]} }, 
                        :conditions => ["products.category_id = categories.id AND products.status = ? AND languages.abbr = ?", true, language], 
                        :group => "categories.id"}}
                        
                        
  named_scope :info, lambda { |category| {
                                  :select => "lang_categories.id 'id', lang_categories.name 'name'", 
                                  :joins => [:lang_category], 
                                  :conditions => ["categories.id = ?", category],
                                  :group => "categories.id"}}
  
  def to_label
    "#{lang_category.first.name}"
  end
  
  after_update :save_languages
  
  def new_lang_category_attributes=(category_attributes)   
    category_attributes.each do |attributes|
      lang_category.build(attributes)
    end
  end
  
  def existing_lang_category_attributes=(category_attributes)
    lang_category.reject(&:new_record?).each do |lang|
      attributes = category_attributes[lang.id.to_s]
      if attributes
        lang.attributes = attributes
      else
        lang_category.delete(lang)
      end
    end
  end
  
  def save_languages
    lang_category.each do |lang|
      lang.save(false)
    end
  end
  
  
end
