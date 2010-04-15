class Prize < ActiveRecord::Base
  has_many :product
  has_many :lang_prize
end
