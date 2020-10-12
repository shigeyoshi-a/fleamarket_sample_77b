// $(function(){
//   $('#like_btn').on('click', function(e){
//     e.preventDefault();
//     let item_Id = $(this).data("item-id");
//     console.log(item_Id)
//     // var formData = new FormData(this);
//     // var url = $(this).attr('action')
//     $.ajax({
//       url:  `/items/${item_Id}/likes`,
//       type: "POST",
//       data: item_Id,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//   })
// })