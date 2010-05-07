class Cover < ActiveRecord::Base
  belongs_to :solution
  has_many   :cover_element, :dependent => :destroy
  

  named_scope :by_date, :order => "public_date DESC"

  named_scope :active,  :select => "products.id 'id', lang_products.name 'product_name', cover_elements.grid_size 'product_grid'", 
                        :joins => {:cover_element => {:product => [:lang_product]}}

  
end
