// $(function(){
//   // お気に入りの登録
//   function buildHTML(data){
//     var html = `.check_btn__like--add
//                   = link_to "/items/${item.id}/likes/:id" , method: :DELETE do
//                     = icon( "fa", "star")
//                     お気に入り
//                     = ${item.id}.${like_id}.length`
//     return html;
//   }

//   $('.check_btn__like').on('click', function(e){
//     e.preventDefault();
//     let item_Id = $(this).data("item-id");
//     $.ajax({
//       type: "POST",
//       url:  `/items/${item_Id}/likes`,
//       data: item_Id,
//       dataType: 'json',
//     })
//     .done(function(data) {
//       let html = buildHTML(data);
//       $('.check_btn__like').append(html);
//     })
//     .fail(function(){
//       alert('お気に入り登録できません');
//     })
//   });

// // お気に入りの削除
//   function buildHTML(like){
//     var html = `.check_btn__like{data: {item_id: @item.id}}
//                   = link_to "/items/${item.id}/likes", method: :POST do
//                     = icon( "fa", "star")
//                     お気に入り
//                     = @item.likes.length`
//     return html;
//   }

//   $('..check_btn__like--add').on('click', function(e){
//     e.preventDefault();
//     let item_Id = $(this).data("item-id");
//     $.ajax({
//       type: "POST",
//       url:  `/items/${item_Id}/likes`,
//       data: item_Id,
//       dataType: 'json',
//     })
//     .done(function(data) {
//       let html = buildHTML(data);
//       $('.check_btn__like').append(html);
//     })
//     .fail(function(){
//       alert('お気に入り削除できません');
//     })
//   });

// })

