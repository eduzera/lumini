class LangSolution < ActiveRecord::Base
  belongs_to :solution
  belongs_to :language
  
  validates_presence_of :name, :description
  validates_uniqueness_of :solution_id, :scope => :language_id, :message => "ja possui idioma selecionado"
end
