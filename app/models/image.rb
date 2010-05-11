class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  belongs_to :image_type

  accepts_nested_attributes_for :image_type

   has_attached_file :img, :styles => {:grid_1 => "45x45#", :grid_2 => "96x96#", :grid_3 => "147x144#", :grid_4 => "198x198#", :grid_6 => "320x216>", :full_screen => "480x320>"},

     :url => "/uploads/:class/:imageable_type/:imageable_id/:id/:style.:extension",
     :path => ":rails_root/public/uploads/:class/:imageable_type/:imageable_id/:id/:style.:extension",
     :default_url => "/images/noimg_grid1.png"

  #validates_attachment_content_type :img, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']


  # named_scope :by_product, lambda { |product, name| { 
  #                                   :joins => [:product, :image_type],
  #                                   :conditions => ["images.product_id = ? AND image_types.name = ?", product, name], 
  #                                   :order => 'image_types.name'}}
                                          
  named_scope :by_imageable_id, lambda {|id|{:conditions => ['imageable_id = ?', id]}}
                     
  named_scope :by_imageable_type, lambda { |type| { :select => "images.id 'id', image_types.name 'name', images.*", :joins => [:image_type], :conditions => ['imageable_type = ?', type.capitalize]}}

  named_scope :by_image_type, lambda { |type| { :joins => [:image_type], :conditions => ['image_types.name = ?', type]}}
  
  named_scope :group_image_type, :group => 'image_types.id'

  named_scope :all_with_filter, lambda {|imageable_type, type| {  :include => [:image_type], :conditions => ["imageable_type = ? AND image_types.name = ?", imageable_type, type]
  }}
  
  named_scope :by_product_category, lambda {|category| { :select => "products.category_id 'category_id'", :joins => "INNER JOIN products ON products.id = images.imageable_id", :conditions => ["products.category_id = ?", category] }}
  
  named_scope :by_order, :order => "images.priority, images.id"
  
  named_scope :by_cover, :conditions => "priority = 0"

                                     
   def dimension(url)
     Paperclip::Geometry.from_file(url)
   end
   
   def size(url)
      File.size(url)
   end
   
   def self.update_order(array)
     for i in 0..(array.length) -1
        image = Image.find array[i].to_i
        image.priority = i unless image.nil?
        image.save
      end
      return true
   end
   
end
