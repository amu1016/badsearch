$(function(){
  $('.date-sort').click(function(){
    $(this).next('.search-sort').removeClass("open");
    $(this).parent().parent().next().next('.search-accordion').slideUp(300);
    $(this).parent().parent().next('.date-accordion').slideToggle();
    $(this).toggleClass("open");
    if($('.date-sort').hasClass('open')) {
      $('.date-down').addClass('rotate');
    }else {
      $('.date-down').removeClass('rotate');
    }
    
    if($('.search-down').hasClass('rotate')) {
      $('.search-down').removeClass('rotate');
    }
  });
});


$(function(){
  $('.search-sort').click(function(){
    $(this).prev('.date-sort').removeClass("open");
    $(this).parent().parent().next('.date-accordion').slideUp(300);
    $(this).parent().parent().next().next('.search-accordion').slideToggle();
    $(this).toggleClass("open");
    if($('.search-sort').hasClass('open')) {
      $('.search-down').addClass('rotate');
    }else {
      $('.search-down').removeClass('rotate');
    }

    if($('.date-down').hasClass('rotate')) {
      $('.date-down').removeClass('rotate');
    }
  });
});