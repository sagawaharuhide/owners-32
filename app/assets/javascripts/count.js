$(function(){
  var count = 0;
  $("#count_button_increment").on('click', function(){
    countUp();
  });
  $("#count_button_decrement").on('click', function(){
    if (count > 0) {
      countDown();
    }
  });
  function countUp(){
    document.getElementById("course_count").innerHTML = ++count;
  }
  function countDown(){
    document.getElementById("course_count").innerHTML = --count;
  }
});

$(function(){
  $("#course_count").on('DOMSubtreeModified propertychange', function(){
    var course_price = $('#course_price').data('price');
    var quantity = $("#course_count").text();
    var total_price = (course_price * quantity).toLocaleString()
    document.getElementById("subtotal").innerHTML = total_price + '円'
    document.getElementById("subtotal").setAttribute("data-price", total_price)
    document.getElementById("sum").innerHTML = total_price + '円'
    document.getElementById("order_quantity").setAttribute("value", quantity)
  });
});
