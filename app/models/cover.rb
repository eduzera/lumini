class Cover < ActiveRecord::Base
  
  belongs_to :solution
  has_many   :cover_element
  
  named_scope :by_date, :order => "created_at DESC"
  
end
