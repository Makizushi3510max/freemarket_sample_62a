$(function() {
   let tabs = $(".tab");
   function tabSwitch() {
     $(".tab").removeClass("active");
     $(this).addClass("active");
     const index = tabs.index(this);
     $(".mypage-item-list").removeClass("show").eq(index).addClass("show");
   }

   tabs.click(tabSwitch);
})