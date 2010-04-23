class ImageType < ActiveRecord::Base
  
  belongs_to :imageable, :polymorphic => true 
  
end
