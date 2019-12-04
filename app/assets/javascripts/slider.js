$(function() {
  $('.slider-list').slick({
    // ドットにクラスを追加
    // ドットの有無
    dots: true,
    // 自動再生
    autoplay: true,
    autoplaySpeed:4000,  //スライド間隔速さ
    speed: 800,
    
    // 止まらないように↓
    pauseOnFocus: false,  
    pauseOnHover: false,
    pauseOnDotsHover: false
  });
});
