
  // カテゴリー選択後に、対応するセレクトボックスを表示させる機能
  function buildSelectBox_Children(category_children){
    // 子カテゴリーのセレクトボックスのオプションを生成
    function buildSelectBox_Children_Options(child){
      var optionHtml =`
        <option value="${child.id}">
          ${child.name}
        </option>`
    return optionHtml;
    }

    var buildSelectBox_Children = `
      <div>
        <div class='select-wrap' id="wrap-child">
          <i class="fa fa-chevron-down"></i>
          <select class="select-default" name="product[child_category_id]" id="product_child_category_id">
          <option value="">---</option>
        </div>
      </div>`

    $(".form-group.category").append(buildSelectBox_Children)

    category_children.forEach(function(child) {
      $("#product_child_category_id").append(buildSelectBox_Children_Options(child))
    });
  };

  // カテゴリー選択後に、対応するセレクトボックスを表示させる機能
  function buildSelectBox_GrandChildren(category_grandchildren){
    // 孫カテゴリーのセレクトボックスのオプションを生成
    function buildSelectBox_GrandChildren_Options(grandchild){
      var optionHtml =`
        <option value="${grandchild.id}">
          ${grandchild.name}
        </option>`
    return optionHtml;
    }

    var buildSelectBox_GrandChildren = `
      <div>
        <div class='select-wrap' id="wrap-grandchild">
          <i class="fa fa-chevron-down"></i>
          <select class="select-default" name="product[grandchild_category_id]" id="product_grandchild_category_id">
          <option value="">---</option>
        </div>
      </div>`

    $(".form-group.category").append(buildSelectBox_GrandChildren)

    category_grandchildren.forEach(function(grandchild) {
      $("#product_grandchild_category_id").append(buildSelectBox_GrandChildren_Options(grandchild))
    });
  };

  // id: "product_root_category_id"のセレクトボックスが選択されると発火
  $(document).on("change", "#product_root_category_id",function(e){
    var selected_category_root = $('#product_root_category_id').val();

    $.ajax({
      url: "/products/get_category_children",
      type: "GET",
      data: { root_category_id: selected_category_root },
      dataType: "json"
    })
    .done(function(category_children){
      // 既に小カテゴリ、孫カテゴリを表示していた場合は削除
      $("#wrap-child").remove()
      $("#wrap-grandchild").remove()
      buildSelectBox_Children(category_children)
    })
    .fail(function(){
      console.log('error');
    })
  })

  // id: "product_child_category_id"のセレクトボックスが選択されると発火
  $(document).on("change", "#product_child_category_id",function(e){
    var selected_category_child = $('#product_child_category_id').val();

    $.ajax({
      url: "/products/get_category_grandchildren",
      type: "GET",
      data: { child_category_id: selected_category_child },
      dataType: "json"
    })
    .done(function(category_grandchildren){
      // 既に孫カテゴリを表示していた場合は削除
      $("#wrap-grandchild").remove()
      buildSelectBox_GrandChildren(category_grandchildren)
    })
    .fail(function(){
      console.log('error');
    })
  })