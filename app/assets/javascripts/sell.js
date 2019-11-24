$(document).on("change", "#product_images",function(e){
  console.log("ほげほげ")
  var input_file = $("#product_images")
  // console.log(input_file[0])
  console.log(input_file)
})


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
