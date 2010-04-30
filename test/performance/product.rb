require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")
require File.expand_path(File.dirname(__FILE__) + "/../fixtures/blueprints")

ImageType.make(:name => "fotografia", :model_name => "Product")
ImageType.make(:name => "desenho",    :model_name => "Product")
ImageType.make(:name => "prize",     :model_name => "Prize")
ImageType.make(:name => "designer",   :model_name => "Designer")

lingua = Language.make
lingua2 = Language.make(:name => "English", :abbr => "en_US")

fabricante = Manufacture.make(:website => "http://www.lumini.com.br")
  lang_fabricante = LangManufacture.make(:name => 'lumini', :manufacture_id => fabricante.id, :language_id => lingua.id)

premio = Prize.make
  lang_premio = LangPrize.make(:name => 'if', :description => 'if design awards', :prize_id => premio.id, :language_id => lingua.id)

premio = Prize.make
  lang_premio = LangPrize.make(:name => 'if gold', :description => 'if gold design awards', :prize_id => premio.id, :language_id => lingua.id)

premio = Prize.make
  lang_premio = LangPrize.make(:name => 'idea', :description => 'idea', :prize_id => premio.id, :language_id => lingua.id)


designer = Designer.make
  lang_designer = LangDesigner.make(:designer_id => designer.id, 
                                    :language_id => lingua.id)

# ------------------------------------------------------------------------------------------------------------------
categoria = Category.make
  balizadores = LangCategory.make( :name => "balizadores", 
                                      :description => "", 
                                      :category_id => categoria.id, 
                                      :language_id => lingua.id)

categoria = Category.make
  piso = LangCategory.make( :name => "piso", 
                                      :description => "", 
                                      :category_id => categoria.id, 
                                      :language_id => lingua.id)

categoria = Category.make
  arandelas = LangCategory.make( :name => "arandelas", 
                                      :description => "", 
                                      :category_id => categoria.id, 
                                      :language_id => lingua.id)

categoria = Category.make
  sistemas = LangCategory.make( :name => "sistemas",
                                      :description => "", 
                                      :category_id => categoria.id, 
                                      :language_id => lingua.id)

categoria = Category.make
  mesa = LangCategory.make( :name => "mesa", 
                                      :description => "", 
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




puts "OK!"
