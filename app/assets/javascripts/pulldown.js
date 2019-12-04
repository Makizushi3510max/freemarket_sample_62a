$(function(){
  $(document).on("mouseover",".header__content__category", function(e) {

    $.ajax({
      url: "/products/get_category_roots",
      type: "GET",
      dataType: "json"
    })
    .done(function(category_roots){
      // console.log(category_roots)
      // category_roots.forEach(function(root) {
      //   console.log(root)
      // });
      buildSelectBox_Children(category_roots);
    })
    .fail(function(){
      console.log('error');
    })
    // カテゴリー選択後に、対応するセレクトボックスを表示させる機能
    function buildSelectBox_Children(category_roots){
      category_roots.forEach(function(root) {
        console.log(root);
        $(".header__content__category").append(buildSelectBox_Children_Options(root))
      });

      // 子カテゴリーのセレクトボックスのオプションを生成
      function buildSelectBox_Children_Options(root){
        var optionHtml = `<div>
                           ${root.name}
                         </div>`

        return optionHtml;
      };
      // var buildSelectBox_Children = `
      // <div>
      //   <div class='header__content__category' id="wrap-grandchild">
      //   </div>
      // </div>`
  
      // $(".header__content__cg").append(buildSelectBox_Children);
  
      // category_roots.forEach(function(root) {
      //   $("#product_root_category_id").append(buildSelectBox_Children_Options(root))
      // });
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
          <div class='parents-parent' id="wrap-grandchild">
            <select class="menu-default" name="product[grandchild_category_id]" id="product_grandchild_category_id">
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
        // console.log(category_grandchildren)
        // $("#wrap-child").remove()
        $("#wrap-grandchild").remove()
        buildSelectBox_GrandChildren(category_grandchildren)
      })
      .fail(function(){
        console.log('error');
      })
    })
  })
})
