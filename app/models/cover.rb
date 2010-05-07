class Cover < ActiveRecord::Base
  belongs_to :solution
  has_many   :cover_element, :dependent => :destroy
  


  named_scope :by_date, lambda {|date|{:conditions => ["public_date = ?", date]}}
  
  named_scope :by_order, :order => "public_date DESC"

  named_scope :active,  :select => "products.id 'id', covers.solution_id 'solution_id', lang_products.name 'product_name', 
                                    cover_elements.grid_size 'product_grid', covers.public_date 'public_date'", 
                        :joins => {:cover_element => {:product => [:lang_product]}}, 
                        :conditions => ["covers.status = ? AND public_date <= ?", true, Time.now]

  
end
