$(function(){

  function sortPlans(plan) {
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
          <div class="price">###円</div>
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
        var html = sortPlans(plan);
      $(html).appendTo('.float-cards')
      });
    });
  });

});

