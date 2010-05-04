class LangStore < ActiveRecord::Base

  belongs_to :store
  belongs_to :language
  
  validates_presence_of :title, :city, :state, :street, :neighborhood, :postal_code
  validates_uniqueness_of :store_id, :scope => :language_id, :message => "ja possui idioma selecionado"

end
