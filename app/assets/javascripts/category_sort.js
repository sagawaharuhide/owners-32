$(function(){

  function sortPlans(plan, price) {
    var html =
    `<a href="/plans/${ plan.id }" class="plan_card_medium">
      <div class="card float-card">
        <img class="card-img-top" src="${ plan.img_url }" alt="Card image cap">
        <div class="card-body">
          <div class="avatar" style="background-image:url(${ plan.avatar });">
        </div>
        <h5 class="card_title">${ plan.title }</h5>
        <div class="d-flex justify-content-lg-between justify-content-end card_footer">
          <div class="location d-lg-inline-block">
          <img class="location_icon" src="https://d1xgtamobon6ik.cloudfront.net/static/images/index/icon-location.svg" alt="location_icon">${ plan.area }
          </div>
          <div class="price">${ price }円〜</div>
        </div>
      </div>`
    ;
    return html;
  }

  $('.category_sort_list').on('click', function() {
    var categoryId = $(this).data('id');
    $.ajax({
      url: 'plans/search',
      type: 'GET',
      data: { id: categoryId },
      dataType: 'json'
    })
    .done(function(plans) {
      $('.plan_card_medium').remove();
      plans.forEach(function(plan) {
      var price = plan.courses[0].price.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,'); //正規表現で数値を3桁区切り
        var html = sortPlans(plan, price);
      $(html).appendTo('.float-cards')
      });
    });
  });

});

