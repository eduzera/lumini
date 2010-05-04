class Prize < ActiveRecord::Base
  has_many :lang_prize
  has_many :product_prize
  has_many :images, :as => :imageable, :dependent => :destroy
  
  accepts_nested_attributes_for :lang_prize
  
  after_update :save_languages
  
  def to_label
    "#{lang_prize.first.name}"
  end

  # has_attached_file :img, :styles => {:grid_1 => "45x45#", :grid_2 => "96x96#" ,:grid_3 => "147x144#",

  # :url => "/uploads/:class/:prize_id/:id/:style.:extension",
  # :path => ":rails_root/public/uploads/:class/:prize_id/:id/:style.:extension",
  # :default_url => "/images/noimg_grid1.png"}

   #named_scope :by_product, lambda {|product| { :joins => {:product_prize => [:product]}, :conditions => ['products.id = ?', product] }}

   named_scope :by_language, lambda { |language| {
                                 :include => {:lang_prize => [:language]},
                                 :conditions => ["languages.abbr = ?", language]}}


  def new_lang_prize_attributes=(prize_attributes)   
    prize_attributes.each do |attributes|
      lang_prize.build(attributes)
    end
  end

  
  def existing_lang_prize_attributes=(prize_attributes)
    lang_prize.reject(&:new_record?).each do |lang|
      attributes = prize_attributes[lang.id.to_s]
      if attributes
        lang.attributes = attributes
      else
        lang_prize.delete(lang)
      end
    end
  end
  
  def save_languages
    lang_prize.each do |lang|
      lang.save(false)
    end
  end
  
  
  
end