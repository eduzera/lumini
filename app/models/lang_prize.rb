class LangPrize < ActiveRecord::Base
  belongs_to :prize
  belongs_to :language
end
