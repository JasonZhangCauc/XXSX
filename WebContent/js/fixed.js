$(function(){

(function(){
	var $window = $(window);
	var $nav = $('#nav');
	var $div2 = $('#div2');

	var navTop = $nav.offset().top;
	$window.scroll(function(){
		
		var scrollTop = $(document).scrollTop();

		if ( scrollTop >= navTop )
		{
			$nav.addClass('fixed');
			$div2.addClass('fixed');
		}else
		{
			$nav.removeClass('fixed');
			$div2.removeClass('fixed');
			};

		});
	})();
	
	
});