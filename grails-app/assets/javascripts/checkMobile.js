var isMobileFlag;
var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};
 
if( isMobile.any() ) {
	isMobileFlag = 1;
}
else{
	isMobileFlag = 0;
}

$(document).ready(function () {
	var normal = $('.normal');
	var mobile = $('.mobile');
	var mobileIcon = $('#mobile-icon');
	var desktopIcon = $('#desktop-icon');

	if(isMobileFlag){
		normal.hide();
		mobileIcon.css("opacity", 1.0);
		desktopIcon.css("opacity", 0.3);
	}
	else{
		mobile.hide();
		desktopIcon.css("opacity", 1.0);
		mobileIcon.css("opacity", 0.3);
	}
	
	desktopIcon.click(function(){
		mobile.hide();
		normal.show();
		desktopIcon.css("opacity", 1.0);
		mobileIcon.css("opacity", 0.3);

	});
	
	mobileIcon.click(function(){
		normal.hide();
		mobile.show();
		mobileIcon.css("opacity", 1.0);
		desktopIcon.css("opacity", 0.3);
	});
	
});