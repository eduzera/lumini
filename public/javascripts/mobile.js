$.jQTouch({	
	statusBar: 'black-translucent',
				preloadImages: [
					'themes/jqt/img/chevron_white.png',
					'themes/jqt/img/bg_row_select.gif',
					'themes/jqt/img/back_button_clicked.png',
					'themes/jqt/img/button_clicked.png'
					],
				addGlossToIcon: false,
				slideSelector: 'a',
				statusBar: 'black',
				icon: 'appicon.png'

});

$(document).ready(function() 
{
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
