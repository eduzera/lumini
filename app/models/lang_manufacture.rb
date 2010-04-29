class LangManufacture < ActiveRecord::Base
  belongs_to :manufacture
  belongs_to :language
end
