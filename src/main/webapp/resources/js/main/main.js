loadJQuery();

function loadJQuery() {
    var oScript = document.createElement("script");
    oScript.type = "text/javascript";
    oScript.charset = "utf-8";		  
    oScript.src = "http://code.jquery.com/jquery-1.6.2.min.js";	
    document.getElementsByTagName("head")[0].appendChild(oScript);
}
$(function(){    
    var mainSlider = new Swiper('#mainslider', {
		    pagination: '.mainslider-pagination',
		    loop:true,
            speed: 600,
		    paginationClickable: true,
		    autoplay: {
                delay : 5000,
            },
            navigation:{
                nextEl: '.mainslider-next',
                prevEl: '.mainslider-prev',
            },
    });
    
    var bsprdSlider = new Swiper('#bsprd',{ 
         slidesPerView: 4,
         slidesPerGroup: 3,
         navigation:{
                nextEl: '.bsprd-next',
                prevEl: '.bsprd-prev',
            },    
    });
    
      var bsprdSlider = new Swiper('#skinprd',{ 
         slidesPerView: 3,
         slidesPerGroup: 1,
         navigation:{
                nextEl: '.skinprd-next',
                prevEl: '.skinprd-prev',
            },    
    });
     var bsprdSlider = new Swiper('#realprd',{ 
         slidesPerView: 4,
         slidesPerGroup: 2,
         navigation:{
                nextEl: '.realprd-next',
                prevEl: '.realprd-prev',
            },    
    });
});    