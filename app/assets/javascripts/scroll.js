$(function(){
  $('#button_course_list').on('click', function(){
    $('html, body').animate({scrollTop: $('#course_list').offset().top}, { duration: '2000', easing: 'swing', });
  });
});
