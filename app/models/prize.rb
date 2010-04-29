class Prize < ActiveRecord::Base

  has_many :lang_prize
  
  has_many :product_prize
  
  after_update :save_languages
  
  def to_label
    "#{lang_prize.first.name}"
  end
  
  
  has_attached_file :img, :styles => {:grid_1 => "45x45#", :grid_2 => "96x96#" ,:grid_3 => "147x144#"},

    :url => "/uploads/:class/:id/:style.:extension",
    :path => ":rails_root/public/uploads/:class/:id/:style.:extension",
    :default_url => "/images/noimg_grid1.png"

  validates_attachment_content_type :img, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']
  
  
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