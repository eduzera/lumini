require 'machinist/active_record'

Image.blueprint do
  img_file_name     nil
  img_content_type  nil
  img_file_size     nil
  img_updated_at    nil
end  

Prize.blueprint do
  status 'true' 
  images.build {Image.make}
end

LangPrize.blueprint do 
  name
  description
  prize_id
  language_id
end

ImageType.blueprint do
  name
  model_name
end

Language.blueprint do
  name  "Portugues Brasil"
  abbr  "pt_BR"
end

Manufacture.blueprint do
  website
end

LangManufacture.blueprint do 
  name
  manufacture_id
  language_id
end

Designer.blueprint do
  name      "Ricardo"
  birthdate "08/09/1986"
  images.build {Image.make}
end

LangDesigner.blueprint do
  biography "Descrição"
  designer_id
  language_id
end

Category.blueprint do
  status        "true"
end

LangCategory.blueprint do
  name
  description
  category_id
  language_id
end


Family.blueprint do
  status      "true"
end

LangFamily.blueprint do
  name
  description
  family_id
  language_id
end


Product.blueprint do
  manufacture_id
  designer_id
  category_id
  family_id
  images.build {Image.make}
end

LangProduct.blueprint do
  name
  description
  tech_description
  product_id
  language_id
end

