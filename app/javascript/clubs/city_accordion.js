$(function(){
  $('.city-accordion-label').click(function(){
    $(this).parent().parent().next('.city-accordion').slideToggle();
    $(this).toggleClass("open");
    if($('.city-accordion-label').hasClass('open')) {
      $('.city-down').addClass('rotate');
    }else {
      $('.city-down').removeClass('rotate');
    }
  });
});
