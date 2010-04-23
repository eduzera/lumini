$.jQTouch({	
	slideSelector: 'a',
	initializeTouch: 'a, .touch', 
	icon: 'jqtouch.png',
    statusBar: 'black-translucent'
});

$(document).ready(function() 
{
	$('.swipe_trigger').live('swipe', function(event, info) {
		alert(info.direction);
	});
	
});