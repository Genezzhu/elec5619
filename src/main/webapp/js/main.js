(function (window, $) {
	'use strict';

	// Cache document for fast access.
	var document = window.document;


	function mainSlider() {
		$('.bxslider').bxSlider({
            pager: false,
            auto: true,
			mode: 'fade',
			nextText: '',
			prevText: '',
            easing: 'cubic-bezier(n,n,n,n)',
            controls: true
		});
	}

	mainSlider();



	$(".bx-controls").addClass('container');
	$(".bx-next").addClass('fa fa-angle-right');
	$(".bx-prev").addClass('fa fa-angle-left');

})(window, jQuery);