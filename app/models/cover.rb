class Cover < ActiveRecord::Base
  belongs_to :solution
  has_many   :cover_element
  
  named_scope :active,  :select => "products.id 'id', covers.solution_id 'solution_id', lang_products.name 'product_name', cover_elements.grid_size 'product_grid'", 
                        :joins => {:cover_element => {:product => [:lang_product]}}
  
end
