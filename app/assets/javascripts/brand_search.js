$(function(){
  $(document).on("keyup", "#product_brand_id",function(){
    // console.log("hoge")s
    let input = $("#product_brand_id").val();
    // console.log(input)
    // $.ajax({
    //   type: "GET",
    //   url: "/users",
    //   data: {keyword: input},
    //   dataType: "json"
    // })
    // .done(function(users){
    //   $("#user-search-result").empty();
    //   if (users.length !== 0){
    //     users.forEach(function(user){
    //       addUser(user);
    //     });
    //   } else if (input.length == 0){
    //     return false;
    //   } else {
    //     addNoUser();
    //   }
    // })
    // .fail(function(){
    //   alert("ユーザ検索に失敗");
    // });
  })
})