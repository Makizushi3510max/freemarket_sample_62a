$(function(){
  $(document).on("keyup", "#product_brand_id",function(){
    // console.log("hoge")s
    let input = $("#product_brand_id").val();
    // console.log(input)
    $.ajax({
      type: "GET",
      url: "/products/get_brands",
      data: {keyword: input},
      dataType: "json"
    })
    .done(function(brands){
      // console.log("success")
      // console.log(data)
      $(".form-suggest-list").empty();
      if (brands.length !== 0){
        brands.forEach(function(brand){
          $(".form-suggest-list").append(`<li id="${brand.id}">${brand.name}</li>`)
        });
      } else if (input.length == 0){
        return false;
      }
    })
    .fail(function(){
      console.log("error")
    });
  })
})