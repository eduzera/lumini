require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")
require File.expand_path(File.dirname(__FILE__) + "/../fixtures/blueprints")

ImageType.make(:name => "fotografia", :model_name => "Product")
ImageType.make(:name => "desenho",    :model_name => "Product")
ImageType.make(:name => "premio",     :model_name => "Prize")
ImageType.make(:name => "designer",   :model_name => "Designer")

lingua = Language.make
fabricante = Manufacture.make

designer = Designer.make
  lang_designer = LangDesigner.make(:designer_id => designer.id, 
                                    :language_id => lingua.id)

# ------------------------------------------------------------------------------------------------------------------
categoria = Category.make
  balizadores = LangCategory.make( :name => "balizadores", 
                                      :description => "que faz baliza", 
                                      :category_id => categoria.id, 
                                      :language_id => lingua.id)

categoria = Category.make
  piso = LangCategory.make( :name => "piso", 
                                      :description => "pra colocar no chão", 
                                      :category_id => categoria.id, 
                                      :language_id => lingua.id)

categoria = Category.make
  arandelas = LangCategory.make( :name => "arandelas", 
                                      :description => "na varanda fica legal", 
                                      :category_id => categoria.id, 
                                      :language_id => lingua.id)

categoria = Category.make
  sistemas = LangCategory.make( :name => "sistemas",
                                      :description => "sistemas de luz ué", 
                                      :category_id => categoria.id, 
                                      :language_id => lingua.id)

categoria = Category.make
  mesa = LangCategory.make( :name => "mesa", 
                                      :description => "para iluminar um jantar romântico", 
                                      :category_id => categoria.id, 
                                      :language_id => lingua.id)
# ------------------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------------------
familia = Family.make
  luz_forma = LangFamily.make(:name => "luz e forma", 
                              :description => "luz e forma", 
                              :family_id => familia.id, 
                              :language_id => lingua.id)
  
familia = Family.make
  luz_arq = LangFamily.make(:name => "luz e arquitetura", 
                            :description => "luz e arquitetura", 
                            :family_id => familia.id, 
                            :language_id => lingua.id)
# ------------------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------------------




  produto = Product.make( :manufacture_id => fabricante.id, 
                          :designer_id => designer.id, 
                          :category_id => piso.category_id, 
                          :family_id => luz_forma.family_id)

    lang_product = LangProduct.make(:name => "bauhaus", 
                                    :description => "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura", 
                                    :tech_description => "lâmpada leitosa", 
                                    :product_id => produto.id, 
                                    :language_id => lingua.id)    
                                     
                                    
  lingua = Language.make(:name => "English", :abbr => "en")
  

    lang_product = LangProduct.make(:name => "bauhaus", 
                                    :description => "mother fuck light", 
                                    :tech_description => "lightttttt", 
                                    :product_id => produto.id, 
                                    :language_id => lingua.id)    


/             
10.times {
  produto = Product.make( :manufacture_id => fabricante.id, 
                          :designer_id => designer.id, 
                          :category_id => piso.category_id, 
                          :family_id => luz_forma.family_id)
                          
    lang_product = LangProduct.make(:name => "bauhaus", 
                                    :description => "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura", 
                                    :tech_description => "lâmpada leitosa", 
                                    :product_id => produto.id, 
                                    :language_id => lingua.id)

  produto = Product.make( :manufacture_id => fabricante.id, 
                          :designer_id => designer.id, 
                          :category_id => piso.category_id, 
                          :family_id => luz_forma.family_id)

      lang_product = LangProduct.make(:name => "kube", 
                                      :description => "luminária linda cara", 
                                      :tech_description => "lâmpada pastosa", 
                                      :product_id => produto.id, 
                                      :language_id => lingua.id)                               
    
  produto = Product.make( :manufacture_id => fabricante.id, 
                          :designer_id => designer.id, 
                          :category_id => piso.category_id, 
                          :family_id => luz_arq.family_id)

      lang_product = LangProduct.make(:name => "bossa", 
                                      :description => "luminária de pista de dança", 
                                      :tech_description => "lâmpada de soja", 
                                      :product_id => produto.id, 
                                      :language_id => lingua.id)    
  
# ------------------------------------------------------------------------------------------------------------------  
  
  produto = Product.make( :manufacture_id => fabricante.id, 
                          :designer_id => designer.id, 
                          :category_id => balizadores.category_id, 
                          :family_id => luz_forma.family_id)

      lang_product = LangProduct.make(:name => "piccoloR", 
                                      :description => "luminária de pista de dança", 
                                      :tech_description => "âmpada de soja", 
                                      :product_id => produto.id, 
                                      :language_id => lingua.id)
                                      
  produto = Product.make( :manufacture_id => fabricante.id, 
                          :designer_id => designer.id, 
                          :category_id => balizadores.category_id, 
                          :family_id => luz_arq.family_id)

      lang_product = LangProduct.make(:name => "lift", 
                                      :description => "luminária lift ué", 
                                      :tech_description => "lâmpada argilosa", 
                                      :product_id => produto.id, 
                                      :language_id => lingua.id)
}
/
puts "OK!"
