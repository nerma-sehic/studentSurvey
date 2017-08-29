$(document).ready(function () {
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
	
		if(isMobileFlag){
			$('#top-holder').css("position","absolute");

		}
		else
			console.log("i tako dosada znam");

    var ApiUrl = document.URL.replace("index.html", "SendMail.aspx/SendMailFunction");
    var slideshowDelayTime = 5000;

    $('html, body').scrollTop(0);

    /*START CONTACT FORM*/

    $("#contact-reset").click(function () {
        $(".inputTekst", "#contact-content-right").each(function () {
            $(this).val("");
        })
        $(".inputMessage", "#contact-content-right").val("");
    });

    $("#contact-send").click(function () {

        $("#contact-send").attr("disabled", "disabled");

        $("#error-msg").hide();
        var submit = true;

        var eMail = $("#contact-email", "#contact-content-right").val();
        var name = $("#contact-name", "#contact-content-right").val();
        var message = $("#contact-message", "#contact-content-right").val();
        var subject = $("#contact-subject", "#contact-content-right").val();

        if (!validateEmail(eMail)) {
            $("#error-msg").html("E-mail address is not valid!");
            submit = false;
        }
        else if (name == "" || message == "") {
            $("#error-msg").html("Name and message are required fields!");
            submit = false;
        }

        if (submit) {
            $("#ajaxLoader").show();
            //Send mail
            var sendMessage = "Send failed!!";

            $.ajax({
                type: "POST",
                url: "SendMail.aspx/SendMailFunction",
                data: '{"name" : "' + name + '" , "eMail" : "' + eMail + '" , "subject" : "' + subject + '" , "message" : "' + message + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (isSent) {
                    if (isSent.d) {
                        sendMessage = "E-mail is sent.";
                        $("#contact-reset").click();
                    }

                    $("#ajaxLoader").hide();
                    $("#send-msg").html(sendMessage);
                    $("#send-msg").show();


                    setTimeout(function () {
                        $("#send-msg").hide();
                    }, 5000);

                    $("#contact-send").removeAttr("disabled");
                },
                error: function () {

                    $("#ajaxLoader").hide();
                    $("#send-msg").html(sendMessage);
                    $("#send-msg").show();


                    setTimeout(function () {
                        $("#send-msg").hide();
                    }, 5000);

                    $("#contact-send").removeAttr("disabled");
                }
            });



        }

        else {
            $("#error-msg").show();

            setTimeout(function () {
                $("#error-msg").hide();
            }, 4000);

            $("#contact-send").removeAttr("disabled");
        }


    });


    //Check e-mail address
    function validateEmail(sEmail) {
        var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (filter.test(sEmail)) {
            return true;
        }
        else {
            return false;
        }
    }
    /*END CONTACT FORM*/

    /*START ANIMATE to View*/
    animateToView = true;
    $("a", "#top-menu").click(function (e) {
        if (animateToView) {
            //Set this menu item as active
            /*$("a" , "#top-menu").removeClass("active");
            $(this).addClass("active");*/
			
			 //Hide product if it's open
		    $(".productDetails", "#content").hide();
			$(".product-item", "#content").removeClass("active");
			
            animateToView = false;
            var elementId = $(this).attr('href');
            $('html, body').animate({ scrollTop: $(elementId).offset().top - 20 }, 'slow', function () {
                animateToView = true;
				
            });
        }

       
        

        return false;
    });

    $(".learnMore", "#slideshow").click(function () {

        /*$("a" , "#top-menu").removeClass("active");
        $("#productMenu").addClass("active");*/

        productId = $(this).attr("href");
        $(productId).click();

        $('html, body').animate({ scrollTop: $("#products").offset().top - 20 }, 'slow', function () {
            animateToView = true;
        });

        return false;
    });
    /*End ANIMATE TO View*/

    //SET Product to active
    $(".product-details-tekst", "#content").find('.show_hide').click(function () {
        $(".product-item", "#content").removeClass("active");
    });
    $(".product-item", "#content").click(function () {
        $(".product-item", "#content").removeClass("active");
        $(this).addClass("active");
    });

    /*START HEADER ANIMATION*/
    var currentPosition = 0;
    var slideWidth = 960;
    var slides = $('.slide');
    var numberOfSlides = slides.length;

    // Remove scrollbar in JS
    $('#slidesContainer').css('overflow', 'hidden');

    // Wrap all .slides with #slideInner div
    slides
.wrapAll('<div id="slideInner"></div>')
    // Float left to display horizontally, readjust .slides width
.css({
    'float': 'left',
    'width': slideWidth
});

    // Set #slideInner width equal to total width of all slides
    $('#slideInner').css('width', slideWidth * numberOfSlides);

    // Insert controls in the DOM
    $('#slideshow')
.prepend('<span class="control" id="leftControl">Clicking moves left</span>')
.append('<span class="control" id="rightControl">Clicking moves right</span>');

    // Hide left arrow control on first load
    manageControls(currentPosition);

    // Create event listeners for .controls clicks
    $('.control').bind('click', function () {
    // Determine new position
    currentPosition = ($(this).attr('id') == 'rightControl') ? currentPosition + 1 : currentPosition - 1;

    // Hide / show controls
    manageControls(currentPosition);
    // Move slideInner using margin-left
    $('#slideInner').animate({
        'marginLeft': slideWidth * (-currentPosition)
    },3000);

    clearInterval(slideshowTimer);
    slideshowTimer = setInterval(animateWithTimer, slideshowDelayTime);
});
    
var slideshowTimer = setInterval(animateWithTimer, slideshowDelayTime);

	function animateWithTimer (){
	    currentPosition = (currentPosition == numberOfSlides-1)? 0 : currentPosition + 1;
	    manageControls(currentPosition);
	    $('#slideInner').animate({
	        'marginLeft': slideWidth * (-currentPosition)
	    }, 1750);
	}

    // manageControls: Hides and Shows controls depending on currentPosition
    function manageControls(position) {
        // Hide left arrow if position is first slide
        if (position == 0) { $('#leftControl').hide() } else { $('#leftControl').show() }
        // Hide right arrow if position is last slide
        if (position == numberOfSlides - 1) { $('#rightControl').hide() } else { $('#rightControl').show() }
    }

    /*END HEADER ANIMATION*/

    /*START PRODUCT ANIMATION*/
    $("#product-1-details").hide();
    $(".show_hide").show();

    $('.show_hide').click(function () {

        if ($(this).attr("id") == "a0") {
            $("#product-1-details").hide('slow');
            $("#product-2-details").hide('slow');
            $("#product-3-details").hide('slow');
            $("#product-4-details").hide('slow');
        }
        else if ($(this).attr("id") == "a1") {
            $("#product-1-details").show('slow');
            $("#product-2-details").hide('slow');
            $("#product-3-details").hide('slow');
            $("#product-4-details").hide('slow');
        }
        else if ($(this).attr("id") == "a2") {
            $("#product-1-details").hide('slow');
            $("#product-2-details").show('slow');
            $("#product-3-details").hide('slow');
            $("#product-4-details").hide('slow');
        }
        else if ($(this).attr("id") == "a3") {
            $("#product-1-details").hide('slow');
            $("#product-2-details").hide('slow');
            $("#product-3-details").show('slow');
            $("#product-4-details").hide('slow');
        }
        else if ($(this).attr("id") == "a4") {
            $("#product-1-details").hide('slow');
            $("#product-2-details").hide('slow');
            $("#product-3-details").hide('slow');
            $("#product-4-details").show('slow');
        }
    });
    /*END PRODUCT ANIMATION*/
});