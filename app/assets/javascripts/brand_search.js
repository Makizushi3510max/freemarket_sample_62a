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
    .done(function(){
      console.log("success")
      // $("#brand-search-result").empty();
      // if (brands.length !== 0){
      //   brands.forEach(function(brand){
      //     addUser(brand);
      //   });
      // } else if (input.length == 0){
      //   return false;
      // } else {
      //   addNoUser();
      // }
    })
    .fail(function(){
      console.log("error")
      // alert("ユーザ検索に失敗");
    });
  })
})