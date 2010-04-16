class Designer < ActiveRecord::Base
  has_one :product
  has_many :lang_designer
end
