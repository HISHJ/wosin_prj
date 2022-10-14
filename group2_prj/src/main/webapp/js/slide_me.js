$(function(){
  $('.slider-single').slick({
  // infinite: true, //양방향 무한 모션
  autoplay:true,
  autoplaySpeed: 2000,
 	slidesToShow: 1,
 	slidesToScroll: 1,
 	arrows: true,
 	fade: false,
 	adaptiveHeight: true,
 	infinite: true,
	useTransform: true,
 	speed: 400,
 	cssEase: 'cubic-bezier(0.77, 0, 0.18, 1)',
 });

 $('.slider-nav')
 	.on('init', function(event, slick) {
 		$('.slider-nav .slick-slide.slick-current').addClass('is-active');
 	})
 	.slick({
   
     autoplay:false,
    autoplaySpeed: 2000,
 		slidesToShow: 10,
 		slidesToScroll: 10,
 		dots: false,
 		focusOnSelect: false,
 		infinite: false,
 		responsive: [{
 			breakpoint: 1024,
 			settings: {
 				slidesToShow: 10,
 				slidesToScroll: 10,
 			}
 		}, {
 			breakpoint: 640,
 			settings: {
 				slidesToShow:10, //3,
 				slidesToScroll: 10,//3,
			}
 		}, {
 			breakpoint: 420,
 			settings: {
 				slidesToShow: 10,//2,
 				slidesToScroll: 10,//2,
		}
 		}]
 	});

 $('.slider-single').on('afterChange', function(event, slick, currentSlide) {
 	$('.slider-nav').slick('slickGoTo', currentSlide);
 	var currrentNavSlideElem = '.slider-nav .slick-slide[data-slick-index="' + currentSlide + '"]';
 	$('.slider-nav .slick-slide.is-active').removeClass('is-active');
 	$(currrentNavSlideElem).addClass('is-active');
 });

 $('.slider-nav').on('click', '.slick-slide', function(event) {
 	event.preventDefault();
 	var goToSingleSlide = $(this).data('slick-index');

 	$('.slider-single').slick('slickGoTo', goToSingleSlide);
 });


//슬릭 - setting에서 추가기능을 찾아서 넣을 수 있습니다. 
$('.play').click(function(){
	$('.slider-single').slick('slickPlay');
});

$('.stop').click(function(){
	$('.slider-single').slick('slickPause');
});

});
