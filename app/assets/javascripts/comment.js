$(function(){
  function buildHTML(comment){
    let html = `
                  ${comment.user_nickname}
                  ${comment.comment}
                  ${comment.created_at}`
    return html;
  }
  $('#new_comment').on('submit',function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data:formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comment__list__main').append(html);
      $('.textbox').val('');
      $('.comment__submit__btn').prop("disabled", false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  })
})