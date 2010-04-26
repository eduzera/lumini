
$(document).ready(function() 
{
	
	$.jQTouch({	
		statusBar: 'black-translucent',
					addGlossToIcon: false,
					slideSelector: 'a',
					statusBar: 'black',
					icon: 'appicon.png'

	});
	
	
	
	$('.swipe_trigger').live('swipe', function(event, info) {
		alert(info.direction);
	});

	
		$('.swipe_trigger').live('click', function(){
			$( '.top-bar' ).stop();
			$( '.bottom-bar' ).stop();
			$( '.top-bar' ).slideToggle(300);
			$( '.bottom-bar' ).slideToggle(300);
			setTimeout( 'hide_bars()' , 3000 );
		});
});

function hide_bars()
		{
			$( '.top-bar' ).slideUp(300);
			$( '.bottom-bar' ).slideUp(300);
		}
