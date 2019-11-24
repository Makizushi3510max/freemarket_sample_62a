$(function() {
  $('.item-photobox').slick({
    speed: 800,
    // console.log('ttt')
    dots: true,

    customPaging: function(slider, i) {
      var thumbSrc = $(slider.$slides[i]).find('img').attr('src');
      return '<img src="' + thumbSrc + '">';
    }
  });

  $('.item-photobox').on("mouseover",".slick-dots > li", function(){
    $(this).click();
  });
});