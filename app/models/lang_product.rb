class LangProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :language
  
  validates_presence_of :name, :description
  #validates_uniqueness_of :product_id, :scope => :language_id, :message => "ja possui idioma selecionado"
end
