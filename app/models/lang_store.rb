class LangStore < ActiveRecord::Base

  belongs_to :store
  belongs_to :language

end
