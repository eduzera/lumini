$.jQTouch({	
	slideSelector: 'a',
	icon: 'jqtouch.png',
    statusBar: 'black-translucent'
});

$(document).ready(function() 
{
	$('.touch').live('swipe', function(event, info) {
		alert(info.direction);
	});
	
});