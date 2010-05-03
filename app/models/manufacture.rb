class Manufacture < ActiveRecord::Base
  has_many :product
  has_many :lang_manufacture
  
  named_scope :active, lambda {|language| {
                        :include => {:product => {:lang_product => [:language]}}, 
                        :conditions => ["products.manufacture_id = manufactures.id AND products.status = ? AND languages.abbr = ?", true, language], 
                        :group => "manufactures.id"}}
                        
  after_update :save_languages


  def to_label
    "#{lang_manufacture.first.name}"
  end


  def new_lang_manufacture_attributes=(manufacture_attributes)   
    manufacture_attributes.each do |attributes|
      lang_manufacture.build(attributes)
    end
  end

  def existing_lang_manufacture_attributes=(manufacture_attributes)
    lang_manufacture.reject(&:new_record?).each do |lang|
      attributes = manufacture_attributes[lang.id.to_s]
      if attributes
        lang.attributes = attributes
      else
        lang_manufacture.delete(lang)
      end
    end
  end

  def save_languages
    lang_manufacture.each do |lang|
      lang.save(false)
    end
  end
end
