require 'machinist/active_record'

ImageType.blueprint do
  name
  model_name
end

Language.blueprint do
  name  "Portugues Brasil"
  abbr  "ptBR"
end

Manufacture.blueprint do
  name    "lumini"
  website "http://www.lumini.com.br"
end

Designer.blueprint do
  name      "Marco Singer"
  birthdate "08/09/1986"
end

LangDesigner.blueprint do
  biography "Esse cara é demais!"
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
end

LangProduct.blueprint do
  name
  description
  tech_description
  product_id
  language_id
end

