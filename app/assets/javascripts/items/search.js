$(document).on('turbolinks:load', ()=> {

  var search_list = $(".search-results");

  function appendItem(item){
    var html = `<div class="content_post">
                  <a href="/items/${item.id}" data-method="get">${item.name}</a><br>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg){
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".searchBox__input").on("keyup", function(){
    var input = $(".searchBox__input").val();
    $.ajax({
      type: 'GET',
      url: '/items/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(items){
      search_list.empty();
      if (items.length !== 0){
        items.forEach(function(item){
          appendItem(item);
        });
      }
      else{
        appendErrMsgToHTML("一致する商品がありません");
      }
    })
  });
});