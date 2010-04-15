class Designer < ActiveRecord::Base
  has_many :product
  has_many :lang_designer
end
