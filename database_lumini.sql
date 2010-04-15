-- IDIOMAS
--------------------------------------------------------------------------------------------------------------------------------------------
insert into languages (name, abbr) values ("Portugues Brasil", "ptBR");
insert into languages (name, abbr) values ("Inglês", "en");
insert into languages (name, abbr) values ("Alemão", "de");
--------------------------------------------------------------------------------------------------------------------------------------------

	
-- FABRICANTES
--------------------------------------------------------------------------------------------------------------------------------------------
insert into manufactures (name, website) values ("lumini", "www.lumini.com.br");
insert into manufactures (name, website) values ("luceplan", "www.luceplan.com.br");
insert into manufactures (name, website) values ("foscarini", "www.foscarini.com.br");
insert into manufactures (name, website) values ("tom dixon", "www.dixoncom.br");
insert into manufactures (name, website) values ("barovier & toso", "www.baroviertoso.com.br");
insert into manufactures (name, website) values ("jieldé", "www.jielde.com.br");
--------------------------------------------------------------------------------------------------------------------------------------------


-- DESIGNERS
--------------------------------------------------------------------------------------------------------------------------------------------
insert into designers (name, birthdate) values ("Marco Singer", "08/09/1986");
	insert into lang_designers (designer_id, biography, language_id) values (1, "Esse cara é demais"		, 1);
		
insert into designers (name, birthdate) values ("Rogério Ceni", "01/04/1972");
	insert into lang_designers (designer_id, biography, language_id) values (2, "Captião do Maior do Mundo" , 1);
	
insert into designers (name, birthdate) values ("Telê Santana", "15/07/1947");
	insert into lang_designers (designer_id, biography, language_id) values (3, "Eterno!"					, 1);
------------------------------------------------------------------------------------------------------------------------------------------


-- CATEGORIAS
--------------------------------------------------------------------------------------------------------------------------------------------
insert into categories (status) values ("true");
	insert into lang_categories (name, description, category_id, language_id) values ("balizadores", "que faz baliza", 				1, 1);
		
insert into categories (status) values ("true");
	insert into lang_categories (name, description, category_id, language_id) values ("piso", "pra colocar no chão", 				2, 1);
		
insert into categories (status) values ("true");
	insert into lang_categories (name, description, category_id, language_id) values ("arandelas", "na varanda fica legal", 		3, 1);
		
insert into categories (status) values ("true");
	insert into lang_categories (name, description, category_id, language_id) values ("sistemas", "sistemas de luz ué", 			4, 1);
		
insert into categories (status) values ("true");
	insert into lang_categories (name, description, category_id, language_id) values ("mesa", "para iluminar um jantar romântico", 	5, 1);
------------------------------------------------------------------------------------------------------------------------------------------


-- FAMILIAS (SUB-CATEGORIAS)
--------------------------------------------------------------------------------------------------------------------------------------------
insert into families (status) values ("true");
	insert into lang_families (name, description, family_id, language_id) values ("luz e forma", "luz e forma", 				1, 1);
insert into families (status) values ("true");
	insert into lang_families (name, description, family_id, language_id) values ("luz e arquitetuera", "luz e arquitetura", 	2, 1);
--------------------------------------------------------------------------------------------------------------------------------------------

-- PRODUTOS
--------------------------------------------------------------------------------------------------------------------------------------------
insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bauhaus", "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura", "\"lâmpada leitosa\"", 1, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("kube", "luminária linda cara", "lâmpada pastosa", 2, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bossa", "luminária de pista de dança", "lâmpada de soja", 3, 1);

--============--============--============--============--============--============--============--============--

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("piccoloR", "luminária de pista de dança", "lâmpada de soja", 4, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("lift", "luminária lift ué", "lâmpada argilosa", 5, 1);

--------------------------------------------------------------------------------------------------------------------------------------------

/*
-- TESTE PERFOMANCE
insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bauhaus", "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura ", "lâmpada leitosa", 6, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("kube", "luminária linda cara", "lâmpada pastosa", 7, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bossa", "luminária de pista de dança", "lâmpada de soja", 8, 1);

--============--============--============--============--============--============--============--============--

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("piccoloR", "luminária de pista de dança", "lâmpada de soja", 9, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("lift", "luminária lift ué", "lâmpada argilosa", 10, 1);
			
		insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
			insert into lang_products (name, description, tech_description, product_id, language_id) 
				values ("bauhaus", "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura ", "lâmpada leitosa", 11, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("kube", "luminária linda cara", "lâmpada pastosa", 12, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bossa", "luminária de pista de dança", "lâmpada de soja", 13, 1);

--============--============--============--============--============--============--============--============--

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("piccoloR", "luminária de pista de dança", "lâmpada de soja", 14, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("lift", "luminária lift ué", "lâmpada argilosa", 15, 1);
			
		insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
			insert into lang_products (name, description, tech_description, product_id, language_id) 
				values ("bauhaus", "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura ", "lâmpada leitosa", 16, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("kube", "luminária linda cara", "lâmpada pastosa", 17, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bossa", "luminária de pista de dança", "lâmpada de soja", 18, 1);

--============--============--============--============--============--============--============--============--

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("piccoloR", "luminária de pista de dança", "lâmpada de soja", 19, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("lift", "luminária lift ué", "lâmpada argilosa", 20, 1);
			
insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bauhaus", "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura ", "lâmpada leitosa", 21, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("kube", "luminária linda cara", "lâmpada pastosa", 22, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bossa", "luminária de pista de dança", "lâmpada de soja", 23, 1);

--============--============--============--============--============--============--============--============--

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("piccoloR", "luminária de pista de dança", "lâmpada de soja", 24, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("lift", "luminária lift ué", "lâmpada argilosa", 25, 1);
					
					
insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bauhaus", "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura ", "lâmpada leitosa", 26, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("kube", "luminária linda cara", "lâmpada pastosa", 27, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bossa", "luminária de pista de dança", "lâmpada de soja", 28, 1);

--============--============--============--============--============--============--============--============--

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("piccoloR", "luminária de pista de dança", "lâmpada de soja", 29, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("lift", "luminária lift ué", "lâmpada argilosa", 30, 1);
			
insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bauhaus", "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura ", "lâmpada leitosa", 31, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("kube", "luminária linda cara", "lâmpada pastosa", 32, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bossa", "luminária de pista de dança", "lâmpada de soja", 33, 1);

--============--============--============--============--============--============--============--============--

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("piccoloR", "luminária de pista de dança", "lâmpada de soja", 34, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("lift", "luminária lift ué", "lâmpada argilosa", 35, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bauhaus", "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura ", "lâmpada leitosa", 36, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("kube", "luminária linda cara", "lâmpada pastosa", 37, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bossa", "luminária de pista de dança", "lâmpada de soja", 38, 1);

--============--============--============--============--============--============--============--============--

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("piccoloR", "luminária de pista de dança", "lâmpada de soja", 39, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("lift", "luminária lift ué", "lâmpada argilosa", 40, 1);
			
insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bauhaus", "luminária de piso com sistema de regulagem de altura luminária de piso com sistema de regulagem de altura ", "lâmpada leitosa", 41, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("kube", "luminária linda cara", "lâmpada pastosa", 42, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 1, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("bossa", "luminária de pista de dança", "lâmpada de soja", 43, 1);

--============--============--============--============--============--============--============--============--

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 1);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("piccoloR", "luminária de pista de dança", "lâmpada de soja", 44, 1);

insert into products (manufacture_id, designer_id, category_id, family_id) values (1, 1, 2, 2);
	insert into lang_products (name, description, tech_description, product_id, language_id) 
		values ("lift", "luminária lift ué", "lâmpada argilosa", 45, 1);
			
*/
