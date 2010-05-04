class LangDesigner < ActiveRecord::Base
  belongs_to :designer
  belongs_to :language
  
  validates_presence_of :biography, :nacionality
  validates_uniqueness_of :designer_id, :scope => :language_id, :message => "ja possui idioma selecionado"
  
end
