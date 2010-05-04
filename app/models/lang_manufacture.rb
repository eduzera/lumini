class LangManufacture < ActiveRecord::Base
  belongs_to :manufacture
  belongs_to :language
  
  validates_presence_of :name
  validates_uniqueness_of :manufacture_id, :scope => :language_id, :message => "ja possui idioma selecionado"
  
end
