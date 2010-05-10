class Designer < ActiveRecord::Base
  has_one :product
  has_many :lang_designer
  has_many :images, :as => :imageable, :dependent => :destroy
  
  accepts_nested_attributes_for :lang_designer
  
  validates_presence_of :name, :birthdate
  
  # has_attached_file :img, :styles => {:grid_1 => "45x45#", :grid_2 => "96x96#" ,:grid_3 => "147x144#"},

  # :url => "/uploads/:class/:id/:style.:extension",
  # :path => ":rails_root/public/uploads/:class/:id/:style.:extension",
  # :default_url => "/images/noimg_grid1.png"

  # validates_attachment_content_type :img, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']
  
  
  named_scope :by_product, lambda { |product| {
                                :joins => [:product],
                                :conditions => ["products.id = ?", product]}}
                                
                                
  named_scope :by_language, lambda { |language| {
                                :select => "designers.id 'id', designers.name 'name', lang_designers.biography 'bio',
                                            designers.birthdate 'birthdate', designers.deathdate 'deathdate'",
                                :joins => {:lang_designer => [:language]},
                                :conditions => ["languages.abbr = ?", language]}}
                                
  after_update :save_languages

   def new_lang_designer_attributes=(designer_attributes)   
     designer_attributes.each do |attributes|
       lang_designer.build(attributes)
     end
   end

   def existing_lang_designer_attributes=(designer_attributes)
     lang_designer.reject(&:new_record?).each do |lang|
       attributes = designer_attributes[lang.id.to_s]
       if attributes
         lang.attributes = attributes
       else
         lang_designer.delete(lang)
       end
     end
   end

   def save_languages
     lang_designer.each do |lang|
       lang.save(false)
     end
   end                              
                        
end

