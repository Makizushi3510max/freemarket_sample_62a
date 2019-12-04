$(function(){
  function previewPrices(){
    // 入力された価格に応じ、手数料と販売利益を変数にセット
    let input_price = $("#product_price").val();
    let commission = Math.floor(input_price * 0.1);
    let profit = input_price - commission;

    // 価格が300円未満の場合、手数料と利益を表示しない
    if(input_price >= 300){
      $("#sales_commission").text("¥" + commission.toLocaleString());
      $("#sales_profit").text("¥" + profit.toLocaleString());
    } else{
      $("#sales_commission").text("-");
      $("#sales_profit").text("-");
    }
  };

  $("#product_price").load(function(){
    console.log("fireeee");
  });

  $("#product_price").keyup(function(){
    previewPrices();
  });
});