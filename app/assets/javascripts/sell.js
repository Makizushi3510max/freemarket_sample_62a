$(function(){
  // 画像のプレビューを表示させる機能

  // 登録済みの画像、これから登録する画像、両方を格納する配列
  var images = []
  // DBに保存済みの画像を格納する配列
  var registered_images = []
  // DBへ保存する前の画像を格納する配列
  var temp_files = []
  // プレビュー中の画像の数を格納する変数
  var preview_count = 0
  // DBから削除される予定の画像IDを保管する配列
  var delete_image_num = []

  var flag = false

  var hoge = []
  var fuga = []

  // プレビューのhtmlを生成
  function buildImagePreviewBox(preview_count,src){
    var previewBox = `<li class="sell-upload-item-image" id="image-${JSON.stringify(preview_count)}">
                        <figure class="sell-upload-figure portrait">
                          <img src="${src}">
                        </figure>
                        <div class="sell-upload-button">
                          <a class="edit-button">編集</a>
                          <a class="delete-button" id="delete-button-${JSON.stringify(preview_count)}">削除</a>
                        </div>
                      </li>`
    return previewBox
  }
  
  var images2 =  `<div class="sell-upload-items have-item-0" id="preview-lower">
                    <ul class="sell-upload-items-images" id="images2">
                    </ul>
                  </div>`
  
  // プレビューを描画する関数
  function renderingPreview(images, preview_count){
    $.each(images, function(index,value){
      // 未描画の画像のみプレビューに追加
      if ((preview_count - 1) < index){
        // 入力値がblob urlだった場合はsrcにそのままblob urlを使用する
        if(value.length){
          var src = value
        // 違ったらblob urlを生成する
        } else {
          var src = URL.createObjectURL(value)
        }
        // 1~4枚目の画像までは普通にプレビューを表示
        if (0 <= preview_count && preview_count <= 3 ){
          $("#images1").append(buildImagePreviewBox(preview_count,src))
          // $("#preview-upper").removeClass("have-item-" + preview_count)
          $("#preview-upper").removeClass (function (index, className) {
            return (className.match (/have-item-\d/g) || []).join(' ');
          });
          $("#preview-upper").addClass("have-item-" + (preview_count + 1))
          // $(".sell-upload-drop-label").removeClass("have-item-" + preview_count)
          $(".sell-upload-drop-label").removeClass (function (index, className) {
            return (className.match (/have-item-\d/g) || []).join(' ');
          });
          $(".sell-upload-drop-label").addClass("have-item-" + (preview_count + 1))
        // 5枚目の画像が存在した場合、drop_boxはhave-item-0に戻る
        } else if (preview_count == 4) {
          if (!$("#preview-lower").length){
            $("#preview-lower").remove();
          }
          $("#images1").append(buildImagePreviewBox(preview_count,src))
          // $("#preview-upper").removeClass("have-item-4")
          $("#preview-upper").removeClass (function (index, className) {
            return (className.match (/have-item-\d/g) || []).join(' ');
          });
          $("#preview-upper").addClass("have-item-5")
          // $(".sell-upload-drop-label").removeClass("have-item-4")
          $(".sell-upload-drop-label").removeClass (function (index, className) {
            return (className.match (/have-item-\d/g) || []).join(' ');
          });
          $(".sell-upload-drop-label").addClass("have-item-0")
        // 6~9枚目の画像は新しいulタグ内に挿入する。
        } else if (5 <= preview_count && preview_count <= 8) {
          if (!$("#images2").length){
            $(".sell-upload-items-container").append(images2)
          }
          $("#images2").append(buildImagePreviewBox(preview_count,src))
          // $("#preview-lower").removeClass("have-item-" + (preview_count - 5))
          $("#preview-lower").removeClass (function (index, className) {
            return (className.match (/have-item-\d/g) || []).join(' ');
          });
          $("#preview-lower").addClass("have-item-" + ((preview_count - 5) + 1))
          // $(".sell-upload-drop-label").removeClass("have-item-" + (preview_count - 5))
          $(".sell-upload-drop-label").removeClass (function (index, className) {
            return (className.match (/have-item-\d/g) || []).join(' ');
          });
          $(".sell-upload-drop-label").addClass("have-item-" + ((preview_count - 5) + 1))
        // 10枚目の画像が存在した場合、drop_boxは消える
        } else {
          $("#images2").append(buildImagePreviewBox(preview_count,src))
          // $("#preview-lower").removeClass("have-item-4")
          $("#preview-lower").removeClass (function (index, className) {
            return (className.match (/have-item-\d/g) || []).join(' ');
          });
          $("#preview-lower").addClass("have-item-5")
          // $(".sell-upload-drop-label").removeClass("have-item-4")
          $(".sell-upload-drop-label").removeClass (function (index, className) {
            return (className.match (/have-item-\d/g) || []).join(' ');
          });
          $(".sell-upload-drop-label").addClass("have-item-5")
        }
        preview_count += 1
      }
    })
    return preview_count
  }


  // fileが変更されると発火
  $(document).on("change", "#product_images",function(e){
    var file = e.target.files;  // ファイルをまとめて取得
    // 新しく追加されたファイルをimagesの末尾に追加
    $.each(file, function(index,value){
      images.push(value)
    })
    console.log("画像を追加したときのimages.length = " + images.length)

    // 画像が1つでも存在していればプレビュー一覧を描画
    if (images.length){
      // プレビュー一覧を描画
      preview_count = renderingPreview(images,preview_count)
    }
  })

  // 画像の削除機能
  $(document).on("click", ".delete-button", function(e){
    // 削除ボタンが押されたら配列の何番目なのかを取得する
    target_image = Number($(this).attr("id").split("-")[2])
    // console.log(target_image)
    // console.log(registered_images.length)

    if (target_image < registered_images.length){
      // fuga = hoge
      // console.log("登録済み画像は削除されました")
      // delete_image_num.push(target_image)
      // delete_image_num.sort()
      // console.log("削除予定の画像番号 = " + delete_image_num)
      // 登録済み画像の配列から削除ボタンが押された画像を削除する
      registered_images.splice(target_image,1)
      hoge.splice(target_image,1)
      // console.log("fuga" + fuga)
      // console.log("残ってる画像hoge" + hoge)

      // var result = fuga.filter(item => 
      //   hoge.indexOf(item) == -1
      // );  
      // console.log("削除予定の画像" + result);
    }
    
    // 削除ボタンが押された画像以降全てのプレビューを一度削除
    for(var i = target_image; i < 10; i++){
      $("#image-" + i).remove()
    }
    console.log("削除ボタンが押された時のtarget_image = " + target_image)
    console.log("削除ボタンが押されたときのimages.length = " + images.length)

    // 削除ボタンが押された画像が配列の最後尾だった場合フラグを立てておく
    if(target_image == images.length - 1){
      flag = true
    }

    // 配列から削除ボタンが押された画像を削除する
    images.splice(target_image,1)

    // 削除された画像以降の画像を描画しなおす
    preview_count = renderingPreview(images,target_image)

    // 削除ボタンが押された画像が配列の最後尾だった場合、クラス名の整合性を取る為に以下の処理が必要
    if(flag == true){
      if(images.length < 5){
        $("#preview-upper").removeClass (function (index, className) {
          return (className.match (/have-item-\d/g) || []).join(' ');
        });
        $("#preview-upper").addClass("have-item-" + preview_count)
        $(".sell-upload-drop-label").removeClass (function (index, className) {
          return (className.match (/have-item-\d/g) || []).join(' ');
        });
        $(".sell-upload-drop-label").addClass("have-item-" + preview_count)
      } else if(images.length == 5){
        $("#preview-upper").removeClass (function (index, className) {
          return (className.match (/have-item-\d/g) || []).join(' ');
        });
        $("#preview-upper").addClass("have-item-5")
        $(".sell-upload-drop-label").removeClass (function (index, className) {
          return (className.match (/have-item-\d/g) || []).join(' ');
        });
        $(".sell-upload-drop-label").addClass("have-item-0")
      } else if(5 < images.length) {
        $("#preview-lower").removeClass (function (index, className) {
          return (className.match (/have-item-\d/g) || []).join(' ');
        });
        $("#preview-lower").addClass("have-item-" + (preview_count - 5))
        $(".sell-upload-drop-label").removeClass (function (index, className) {
          return (className.match (/have-item-\d/g) || []).join(' ');
        });
        $(".sell-upload-drop-label").addClass("have-item-" + (preview_count - 5))
      }
      flag = false
    }
  })

  // 商品新規登録の時
  $('#product-new-form').submit(function(event){
    event.preventDefault();

    var formData = new FormData(this);
    $.each(images, function(index,image){
      formData.append('image' + index,image,image.name)
    })
    formData.append('images_length', images.length)
    $.ajax({
      url: "/products",
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(){
      window.location.href = '/';
    })
    .fail(function(){
      alert("error")
    })
  })

  // 商品編集の時
  $('#product-edit-form').submit(function(event_edit){
    event_edit.preventDefault();

    var formData = new FormData(this);
    $.each(images, function(index,image){
      if ((registered_images.length - 1) < index){
        // formData.append('image' + index,image,image.name)
        temp_files.push(image)
      }
    })
    $.each(temp_files, function(index,image){
      formData.append('image' + index,image,image.name)
    })
    formData.append('images_length', temp_files.length)
    formData.append('remain_image_num', hoge)
    $.ajax({
      url: "/products/" + gon.product_id ,
      type: "PATCH",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(){
      window.location.href = '/';
    })
    .fail(function(){
      alert("error")
    })
  })

  // 商品編集画面を読み込んだ時に実行
  $("#product-edit-form").ready(function(){
    // Railsコントローラから渡されたblobをregistered_imagesに格納
    registered_images = gon.images

    // 登録済み画像をimagesに追加
    $.each(registered_images, function(index,value){
      images.push(value)
      console.log(value.length)
      hoge.push(index)
    })

    // 画像が1つでも存在していればプレビュー一覧を描画
    if (images.length){
      // プレビュー一覧を描画
      preview_count = renderingPreview(images,preview_count)
    }
  });
})