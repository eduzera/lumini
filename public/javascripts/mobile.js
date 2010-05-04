$.jQTouch({
	statusBar: 'black-translucent', 
	addGlossToIcon: false, 
	slideSelector: 'a', 
	statusBar: 'black', 
	icon: 'appicon.png'
});

$(document).ready(function(){
	$(function(){ 
		var jQT = $.jQTouch();
		jQT.addAnimation({ name: 'slideback', selector: '.slideback' }); 
	});
});


function gallery_start() 
{	
	var $cur_id = $('.current').attr('id'); 
	var $new_id = parseInt($cur_id.substr($cur_id.lastIndexOf('-')+1))+1;


	$('#page-'+$new_id+' .swipe_trigger').bind('swipe', function( event , info ){
		if (info.direction == 'right') {
			$( '#page-'+$new_id+' .bottom-bar a.prev' ).tap();
		}else {
			$( '#page-'+$new_id+' .bottom-bar a.next' ).tap();
		}
		
		setTimeout('remove_swipe('+$new_id+')', 5)
	});
	
/*	
	$('#page-'+$new_id+' .swipe_trigger').bind('click', function(){ 
		$( '#page-'+$new_id+' .bottom-bar a.next' ).tap();
	});
*/


	$('#page-'+$new_id+' .swipe_trigger').bind('click', function(){
		$( '.top-bar' ).stop();
		$( '.bottom-bar' ).stop();
		$( '.top-bar' ).slideToggle(300);
		$( '.bottom-bar' ).slideToggle(300);
		//setTimeout( 'hide_bars()' , 3000 );
	});

}


function slideshow_start() 
{
	var $cur_id = $('.current').attr('id'); 
	var $new_id = parseInt($cur_id.substr($cur_id.lastIndexOf('-')+1))+1;
	
	$('#page-'+$new_id+' .swipe_trigger').bind('click', function(){
		$( '.top-bar' ).stop();
		$( '.bottom-bar' ).stop();
		$( '.top-bar' ).slideToggle(300);
		$( '.bottom-bar' ).slideToggle(300);
		//setTimeout( 'hide_bars()' , 3000 );
	});
}


function remove_swipe(id){
	$('#page-'+id+' .swipe_trigger').unbind('swipe');
}


function hide_bars()
{
	$( '.top-bar' ).slideUp(300);
	$( '.bottom-bar' ).slideUp(300);

}
