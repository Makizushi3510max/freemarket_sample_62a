document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null ){
      Payjp.setPublicKey("pk_test_1f10168ec7287f0734a4a25e");
      let btn = document.getElementById("token_submit");
      btn.addEventListener("ckick", e => {
        e.preventDefault();
        let card = {
          number: document.getElementById("payment_card_no").nodeValue,
          cvc: document.getElementById("payment_card_security_code").value,
          exp_month: document.getElementById("card_expiration_date_2i").value,
          exp_year: document.getElementById("card_expiration_date_1i").value
        };
        Payjp.createToken(card, (status, response) => {
          if (status == 200){
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );
            document.inputForm.submit();
            alert("登録が完了しました");
          } else {
            alert("カード情報が正しくありません。");
          }
        });
      });
    }
  },
  false
);