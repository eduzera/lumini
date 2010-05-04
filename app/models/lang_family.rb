class LangFamily < ActiveRecord::Base
  belongs_to :family
  belongs_to :language
  
  validates_presence_of :name, :description
  validates_uniqueness_of :family_id, :scope => :language_id, :message => "ja possui idioma selecionado"
end
