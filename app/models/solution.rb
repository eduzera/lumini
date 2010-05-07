class Solution < ActiveRecord::Base
  has_many :lang_solution
  has_many :images, :as => :imageable
  
  accepts_nested_attributes_for :lang_solution
  
  after_update :save_languages
  
  named_scope :all_with_filter, :select => "solutions.id 'id', lang_solutions.name 'name', lang_solutions.description 'description'",
                                :joins => [:images, {:lang_solution => [:language]}], 
                                :group => "id"
  
  named_scope :by_language, lambda { |language| {
                                :joins => {:lang_solution => [:language]},
                                :conditions => ["languages.abbr = ?", language]}}
  
  def to_label
    "#{lang_solution.first.name}"
  end
  
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
