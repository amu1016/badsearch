$(function(){
  $('.js-modal-open').on('click',function(){
      $('.js-modal').fadeIn();
      return false;
  });
  $('.js-modal-close').on('click',function(){
      $('.js-modal').fadeOut();
      return false;
  });
});

$(function(){
  $('.level-modal-open').on('click',function(){
      $('.level-modal').fadeIn();
      return false;
  });
  $('.level-modal-close').on('click',function(){
      $('.level-modal').fadeOut();
      return false;
  });
});

$(function(){
  $('.mail-modal-open').on('click',function(){
      $('.mail-modal').fadeIn();
      return false;
  });
  $('.mail-modal-close').on('click',function(){
      $('.mail-modal').fadeOut();
      return false;
  });
});