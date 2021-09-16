$(function(){
  $('.search-accordion-label-right').click(function(){
    $(this).parent().next('.search-accordion').slideToggle();
    $(this).toggleClass("open");
    if($('.search-accordion-label-right').hasClass('open')) {
      $('.search-down').addClass('rotate');
    }else {
      $('.search-down').removeClass('rotate');
    }
  });
});