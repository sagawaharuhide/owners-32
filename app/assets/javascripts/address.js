$(function(){
  if ($('#address_js').css('display') == 'none') {
    $("#address_button_js").on("click",function(){
      console.log('aaa')
      $("#address_js").show();
      $('input[name="order[address_id]"]').prop('checked', false);
    });
  } else {
    $("#address_button_js").on("click",function(){
         console.log('bbb')
      $("#address_js").hide();
    });
  }
});

$(function(){
  $('input[name="order[address_id]"]:radio').change(function(){
    $("#address_js").hide();
  });
});
