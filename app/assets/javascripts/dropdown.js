$(function(){

  $('.down-arrow').hover(function(){
    $(this).parent().find('ul').slideDown();
  });

  $(document).on('click', function(){ //欄外クリックでslideUp
    $('.dropdown-categories__children').slideUp();
  })

});
