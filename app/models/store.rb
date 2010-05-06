class Store < ActiveRecord::Base
  
  has_many :lang_store
  
  after_update :save_languages
  
  validates_presence_of :telephone, :email, :operation
  validates_format_of :email, :with => /^[\'_]*([a-zA-Z0-9\-]+(\.|\_*)?)+@([a-zA-Z][a-zA-Z0-9\-]+(\.|\-*\.))+[a-zA-Z]{2,6}$/ , :message => " Invalido"
  
  accepts_nested_attributes_for :lang_store
  
  
  named_scope :active, :select => "stores.email 'email', stores.operation 'operation', stores.telephone 'telephone', 
                                  lang_stores.title 'title', lang_stores.city 'city', lang_stores.state 'state', 
                                  lang_stores.street 'street' , lang_stores.neighborhood 'neighborhood' , lang_stores.postal_code 'postal_code'",
                        :joins => {:lang_store => [:language]}
  
  
  
  def new_lang_store_attributes=(store_attributes)   
    store_attributes.each do |attributes|
      lang_store.build(attributes)
    end
  end
  
  def existing_lang_store_attributes=(store_attributes)
    lang_store.reject(&:new_record?).each do |lang|
      attributes = store_attributes[lang.id.to_s]
      if attributes
        lang.attributes = attributes
      else
        lang_store.delete(lang)
      end
    end
  end
  
  def save_languages
    lang_store.each do |lang|
      lang.save(false)
    end
  end
  
end
