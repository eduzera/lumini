

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


	// add by brancher => 22/04/2010
	$('.categories_browser > li').click( function(){
		$( this ).toggleClass( 'open' );
		$( this ).find( 'ul.with_images').slideToggle( 500 );
	});
	
	$('.swipe_trigger').swipe( function(info) {
		alert(info.direction);
	});
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

//Adiciona novo campo de premio para um produto. by EZaghi => 20/04/2010
function add_new_prize(){
	
	$.get('/admin/products/add_new_prize',
		function(result)
		{
			$('#product_prize').append(result)
		});
}
