class LangCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :language
  
  validates_presence_of :name, :description
  validates_uniqueness_of :category_id, :scope => :language_id, :message => "ja possui idioma selecionado"
end
