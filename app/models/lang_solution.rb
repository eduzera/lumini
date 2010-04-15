class LangSolution < ActiveRecord::Base
  belongs_to :solution
  belongs_to :language
end
