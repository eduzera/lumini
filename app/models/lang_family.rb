class LangFamily < ActiveRecord::Base
  belongs_to :family
  belongs_to :language
end
