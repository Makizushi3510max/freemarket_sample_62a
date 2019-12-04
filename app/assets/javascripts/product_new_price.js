$(function(){
  function previewPrices(){
    // 入力された価格に応じ、手数料と販売利益を変数にセット
    let input_price = $("#product_price").val();
    let commission = Math.floor(input_price * 0.1);
    let profit = input_price - commission;

    // 適正な価格が入力されている場合、手数料と利益を表示する
    if(input_price >= 300 && input_price <= 9999999){
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