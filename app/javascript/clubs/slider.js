document.addEventListener('DOMContentLoaded', function(){
  if( document.getElementById('slider-content')){
    $(".slider").slick({
      arrows: false,
      autoplay: true,
      autoplaySpeed: 4000,
      centerMode: true,
      centerPadding: "30px",
      dots: true,
      // fade: true,
      slidesToShow: 1,
      speed: 400,
    });
  };
});