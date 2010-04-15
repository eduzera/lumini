class LangDesigner < ActiveRecord::Base
  belongs_to :designer
  belongs_to :language
end
