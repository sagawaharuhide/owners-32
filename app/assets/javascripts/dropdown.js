$(function(){

  $('.down-arrow').hover(function(){
    $('.dropdown-categories__children').slideDown();
  });

  $(document).on('click', function(){ //欄外クリックでslideUp
    $('.dropdown-categories__children').slideUp();
  })

});
