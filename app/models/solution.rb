class Solution < ActiveRecord::Base
  has_many :lang_solution
  has_many :images, :as => :imageable
  
  accepts_nested_attributes_for :lang_solution
  
  after_update :save_languages
  
  def new_lang_solution_attributes=(solution_attributes)   
    solution_attributes.each do |attributes|
      lang_solution.build(attributes)
    end
  end
  
  def existing_lang_solution_attributes=(solution_attributes)
    lang_solution.reject(&:new_record?).each do |lang|
      attributes = solution_attributes[lang.id.to_s]
      if attributes
        lang.attributes = attributes
      else
        lang_solution.delete(lang)
      end
    end
  end
  
  def save_languages
    lang_solution.each do |lang|
      lang.save(false)
    end
  end
  
  
end
