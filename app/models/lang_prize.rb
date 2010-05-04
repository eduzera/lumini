class LangPrize < ActiveRecord::Base
  belongs_to :prize
  belongs_to :language
  
  validates_presence_of :name, :description
  validates_uniqueness_of :prize_id, :scope => :language_id, :message => "ja possui idioma selecionado"
  
end
