class Cover < ActiveRecord::Base
  
  belongs_to :solution
  has_many   :cover_element
  
end
