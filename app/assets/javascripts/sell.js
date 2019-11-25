$(function(){
  $(document).on("change", "#product_images",function(e){
    var file = $(this).prop('files')
    console.log(file);
    // console.log("ほげほげ")
    // var input_file = $("#product_images");
    // console.log(input_file[0]);
    // console.log(input_file)
    // var items = input_file[0].files;
    // console.log(items[0])
    // var image = `<img class= "lower-message__image" src="${message.image_url}">`;
  })



  var buildSelectBox_Children = `
  <div>
    <div class='select-wrap'>
      <i class="fa fa-chevron-down"></i>
      <select class="select-default" name="product[category_id]" id="product_category_id">
      <option value="">---</option>
    </div>
  </div>`

  function buildSelectBox_Children_Options(child){
    var optionHtml =`
    <option value="${child.id}">
      ${child.name}
    </option>
  `
  return optionHtml;
  };


  $(document).on("change", "#product_root_category_id",function(e){
    // console.log("ほげ")
    var selected_category_root = $('#product_root_category_id').val();
    console.log(selected_category_root)

    $.ajax({
      url: "/products/get_category_children",
      type: "GET",
      data: { root_category_id: selected_category_root },
      dataType: "json"
    })
    .done(function(data){
      console.log(data);
      $(".form-group.category").append(buildSelectBox_Children)
      data.forEach(function( child ) {
        console.log(child)
        $("#product_category_id").append(buildSelectBox_Children_Options(child))
      });
      // $("#product_category_id").append(buildSelectBox_Children_Options(data))
      // console.log();
      // console.log(category_children)

    })
    .fail(function(){
      console.log('error');
    })
  })
})

// var image = message.image_url ? `<img class= "lower-message__image" src="${message.image_url}">` : "" ;

// $(document).on("change", "#file_photo", function(e) {
//   var reader;
//   if (e.target.files.length) {
//     reader = new FileReader;
//     reader.onload = function(e) {
//       var userThumbnail;
//       userThumbnail = document.getElementById('thumbnail');
//       $("#userImgPreview").addClass("is-active");
//       userThumbnail.setAttribute('src', e.target.result);
//     };
//     return reader.readAsDataURL(e.target.files[0]);
//   }
// });
