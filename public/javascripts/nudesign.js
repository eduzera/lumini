

$(document).ready(function() 
{
	//Metodo para arrumar layout no Edit de Produto nos campos de language. by EZaghi => 20/04/2010
	if ($("#language_product").size() != 0)
	{
		totalBox = $('#language_product').find('.form-sub-container');
		
		if (totalBox.size() == 4)
		{
			$(totalBox[3]).addClass('omega');
			
			link = $('.add_new_language').find('a')
			$(link[0]).replaceWith('&nbsp;');
		}
	}
	
	//Metodo para arrumar layout no Edit de Premio nos campos de language. by EZaghi => 27/04/2010
	if ($("#language_prize").size() != 0)
	{
		totalBox = $('#language_prize').find('.form-sub-container');
		
		if (totalBox.size() == 4)
		{
			$(totalBox[3]).addClass('omega');
			
			link = $('.add_new_language_prize').find('a')
			$(link[0]).replaceWith('&nbsp;');
		}
	}
	
	if ($("#language_solution").size() != 0)
	{
		totalBox = $('#language_solution').find('.form-sub-container');
		
		if (totalBox.size() == 4)
		{
			$(totalBox[3]).addClass('omega');
			
			link = $('.add_new_language_solution').find('a')
			$(link[0]).replaceWith('&nbsp;');
		}
	}
	
	if ($("#language_category").size() != 0)
	{
		totalBox = $('#language_category').find('.form-sub-container');
		
		if (totalBox.size() == 4)
		{
			$(totalBox[3]).addClass('omega');
			
			link = $('.add_new_language_category').find('a')
			$(link[0]).replaceWith('&nbsp;');
		}
	}
	
	if ($("#language_manufacture").size() != 0)
	{
		totalBox = $('#language_manufacture').find('.form-sub-container');
		
		if (totalBox.size() == 4)
		{
			$(totalBox[3]).addClass('omega');
			
			link = $('.add_new_language_manufacture').find('a')
			$(link[0]).replaceWith('&nbsp;');
		}
	}
	
	if ($("#language_family").size() != 0)
	{
		totalBox = $('#language_family').find('.form-sub-container');
		
		if (totalBox.size() == 4)
		{
			$(totalBox[3]).addClass('omega');
			
			link = $('.add_new_language_family').find('a')
			$(link[0]).replaceWith('&nbsp;');
		}
	}
	
	if ($("#language_designer").size() != 0)
	{
		totalBox = $('#language_designer').find('.form-sub-container');
		
		if (totalBox.size() == 4)
		{
			$(totalBox[3]).addClass('omega');
			
			link = $('.add_new_language_designer').find('a')
			$(link[0]).replaceWith('&nbsp;');
		}
	}
	
	if ($("#language_store").size() != 0)
	{
		totalBox = $('#language_store').find('.form-sub-container');
		
		if (totalBox.size() == 4)
		{
			$(totalBox[3]).addClass('omega');
			
			link = $('.add_new_language_store').find('a')
			$(link[0]).replaceWith('&nbsp;');
		}
	}


	// add by brancher => 22/04/2010
	$('.categories_browser > li').click( function(){
		$( this ).toggleClass( 'open' );
		$( this ).find( 'ul.with_images').slideToggle( 500 );
	});
	
	//add token for rails/form => 23/04/2010
	$(document).ajaxSend(function(event, request, settings) {
	  if (typeof(AUTH_TOKEN) == "undefined") return;
	  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
	  settings.data = settings.data || "";
	  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
	}); 
	
	$('.product_save_admin').click( function(){
		$('form').submit();
	});
	
	$('.prize_save_admin').click( function(){
		$('form').submit();
	});
	
	$('.designer_save_admin').click( function(){
		$('form').submit();
	});	
	
	$('.store_save_admin').click( function(){
		$('form').submit();
	});
	
	$('.category_save_admin').click( function(){
		$('form').submit();
	});
	
	$('.manufacture_save_admin').click( function(){
		$('form').submit();
	});
	
	$('.family_save_admin').click( function(){
		$('form').submit();
	});
	
	$('.solution_save_admin').click( function(){
		$('form').submit();
	});
	
	$("#designer_birthdate").datepicker();
	$("#designer_deathdate").datepicker();
	
 });

//Adiciona novo campo de Linga para um produto. by EZaghi => 19/04/2010
function add_new_language(){

	$.get('/admin/products/add_new_language',
		function(result)
		{	
			$('#language_product').append(result);
			
			totalBox = $('#language_product').find('.form-sub-container');
			
			if(totalBox.size()%4 == 0)
			{
				//Define ultimo elemento como omega
				$(totalBox[totalBox.size() - 1]).addClass('omega');
				
				//Oculta link para add mais linguas. Limite eh 4
				link = $('.add_new_language').find('a');
				$(link[0]).replaceWith('&nbsp;');
			}
		});
}

//Adiciona novo campo de Linga para um produto. by EZaghi => 19/04/2010
function add_new_language_prize(){

	$.get('/admin/prizes/add_new_language',
		function(result)
		{	
			$('#language_prize').append(result);
			
			totalBox = $('#language_prize').find('.form-sub-container');
			
			if(totalBox.size()%4 == 0)
			{
				//Define ultimo elemento como omega
				$(totalBox[totalBox.size() - 1]).addClass('omega');
				
				//Oculta link para add mais linguas. Limite eh 4
				link = $('.add_new_language_prize').find('a');
				$(link[0]).replaceWith('&nbsp;');
			}
		});
}

//Adiciona novo campo de Linga para um Loja. by EZaghi => 28/04/2010
function add_new_language_store(){

	$.get('/admin/stores/add_new_language',
		function(result)
		{	
			$('#language_store').append(result);
			
			totalBox = $('#language_store').find('.form-sub-container');
			
			if(totalBox.size()%4 == 0)
			{
				//Define ultimo elemento como omega
				$(totalBox[totalBox.size() - 1]).addClass('omega');
				
				//Oculta link para add mais linguas. Limite eh 4
				link = $('.add_new_language_store').find('a');
				$(link[0]).replaceWith('&nbsp;');
			}
		});
}

//Adiciona novo campo de Linga para um Categoria. by EZaghi => 28/04/2010
function add_new_language_category(){

	$.get('/admin/categories/add_new_language',
		function(result)
		{	
			$('#language_category').append(result);
			
			totalBox = $('#language_category').find('.form-sub-container');
			
			if(totalBox.size()%4 == 0)
			{
				//Define ultimo elemento como omega
				$(totalBox[totalBox.size() - 1]).addClass('omega');
				
				//Oculta link para add mais linguas. Limite eh 4
				link = $('.add_new_language_category').find('a');
				$(link[0]).replaceWith('&nbsp;');
			}
		});
}

//Adiciona novo campo de Lingua para uma Marca. by EZaghi => 29/04/2010
function add_new_language_manufacture(){

	$.get('/admin/manufactures/add_new_language',
		function(result)
		{	
			$('#language_manufacture').append(result);
			
			totalBox = $('#language_manufacture').find('.form-sub-container');
			
			if(totalBox.size()%4 == 0)
			{
				//Define ultimo elemento como omega
				$(totalBox[totalBox.size() - 1]).addClass('omega');
				
				//Oculta link para add mais linguas. Limite eh 4
				link = $('.add_new_language_manufacture').find('a');
				$(link[0]).replaceWith('&nbsp;');
			}
		});
}

//Adiciona novo campo de Lingua para uma Designer. by EZaghi => 29/04/2010
function add_new_language_designer(){

	$.get('/admin/designers/add_new_language',
		function(result)
		{	
			$('#language_designer').append(result);
			
			totalBox = $('#language_designer').find('.form-sub-container');
			
			if(totalBox.size()%4 == 0)
			{
				//Define ultimo elemento como omega
				$(totalBox[totalBox.size() - 1]).addClass('omega');
				
				//Oculta link para add mais linguas. Limite eh 4
				link = $('.add_new_language_designer').find('a');
				$(link[0]).replaceWith('&nbsp;');
			}
		});
}
//Adiciona novo campo de Lingua para uma Designer. by EZaghi => 29/04/2010
function add_new_language_family(){

	$.get('/admin/families/add_new_language',
		function(result)
		{	
			$('#language_family').append(result);
			
			totalBox = $('#language_family').find('.form-sub-container');
			
			if(totalBox.size()%4 == 0)
			{
				//Define ultimo elemento como omega
				$(totalBox[totalBox.size() - 1]).addClass('omega');
				
				//Oculta link para add mais linguas. Limite eh 4
				link = $('.add_new_language_family').find('a');
				$(link[0]).replaceWith('&nbsp;');
			}
		});
}

//Adiciona novo campo de Linga para uma Solucao. by EZaghi => 29/04/2010
function add_new_language_solution(){

	$.get('/admin/solutions/add_new_language',
		function(result)
		{	
			$('#language_solution').append(result);
			
			totalBox = $('#language_solution').find('.form-sub-container');
			
			if(totalBox.size()%4 == 0)
			{
				//Define ultimo elemento como omega
				$(totalBox[totalBox.size() - 1]).addClass('omega');
				
				//Oculta link para add mais linguas. Limite eh 4
				link = $('.add_new_language_solution').find('a');
				$(link[0]).replaceWith('&nbsp;');
			}
		});
}

//Adiciona novo campo de premio para um produto. by EZaghi => 20/04/2010
function add_new_prize(){
	
	$.get('/admin/products/add_new_prize',
		function(result)
		{
			$('#product_prize').append(result)
		});
}
