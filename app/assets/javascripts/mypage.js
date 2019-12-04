$(function() {
   let tabs = $(".tab");
   function tabSwitch1() {
     $(".tab").removeClass("active");
     $(this).addClass("active");
     const index = tabs.index(this);
     $(".mypage-item-list").removeClass("show").eq(index).addClass("show");
   }
   tabs.click(tabSwitch1);

   let mypagetabs = $(".mypagetab");
   function tabSwitch2() {
     $(".mypagetab").removeClass("active");
     $(this).addClass("active");
     const index = tabs.index(this);
     $(".mypage-tab-transaction").removeClass("active").eq(index).addClass("active");
   }
   mypagetabs.click(tabSwitch2);

})