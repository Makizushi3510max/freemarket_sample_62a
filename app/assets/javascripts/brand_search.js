$(function(){
  $(document).on("keyup", "#product_brand_name",function(){
    let input = $("#product_brand_name").val();
    $.ajax({
      type: "GET",
      url: "/products/get_brands",
      data: {keyword: input},
      dataType: "json"
    })
    .done(function(brands){
      $(".form-suggest-list").empty();
      if (brands.length !== 0){
        brands.forEach(function(brand){
          $(".form-suggest-list").append(`<li id="brand-id-${brand.id}">${brand.name}</li>`)
        });
      } else if (input.length == 0){
        return false;
      }
    })
    .fail(function(){
      console.log("error")
    });
  })
  $(document).on("click","[id^=brand-id-]",function(){
    var target_brand_id = Number($(this).attr("id").split("-")[2])
    $('#product_brand_name').val([$(this).text()]);
    $(".form-suggest-list").empty()
    $(".input-wrap").append(`<input type="hidden" name="product[brand_id]" value='${target_brand_id}'></input>`)
  })
})

