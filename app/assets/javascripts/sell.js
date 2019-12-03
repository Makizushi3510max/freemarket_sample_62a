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
  function renderingPreview(images,preview_count){
    $.each(images, function(index,value){
      // 未描画の画像のみプレビューに追加
      if ((preview_count - 1) < index){
        var src = URL.createObjectURL(value)
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
    var file = e.target.files;  // ファイルを配列に格納
    // var fd = new FormData($(this)[0]);
    // console.log($(this))
    // 新しく追加されたファイルをimagesの末尾に追加
    $.each(file, function(index,value){
      images.push(value)
    })

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

    // 削除ボタンが押された画像以降全てのプレビューを一度削除
    for(var i = target_image; i < 10; i++){
      $("#image-" + i).remove()
    }

    // 削除ボタンが押された画像が配列の最後尾だった場合
    if(target_image == images.length - 1){
      flag = true
    }

    // 配列から削除ボタンが押された画像を削除する
    images.splice(target_image,1)

    // 削除された画像以降の画像を描画しなおす
    preview_count = renderingPreview(images,target_image)

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
    }
  })

  $('form').submit(function(event){
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

})