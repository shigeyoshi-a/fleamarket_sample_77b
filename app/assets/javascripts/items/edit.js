$(document).on('turbolinks:load', ()=> {
  // 画像フォームの追加
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file" name="item[item_images_attributes][${index}][image]" id="item_item_images_attributes_${index}_image">
                    <br>
                  </div>`;
    return html;
  }
  // プレビュー画像の生成
  const buildImg = (index, url)=> {
    const html = `<div class="preview-box">
                    <div class="upper-box">
                      <img class="preview-image" data-index="${index}" src="${url}" width="100px" height="100px">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <label class="edit-btn">編集</label>
                      </div>
                      <div class="delete-box">
                        <div class="js-remove">
                          <span class="edit-btn">削除</span>
                        </div>
                      </div>
                    </div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつけるための配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  // 画像ファイル選択時の動作
  $('#image-box').on('change', '.js-file', function(e){
    // .js-fileの親要素のカスタムデータを取得
    const targetIndex = $(this).parent().data('index');
   
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]){
      img.setAttribute('src', blobUrl);
    } else {
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#hidden-content').append(buildFileField(fileIndex[0]));
      //プレビューの数でラベルのオプションを更新する
      $('.label-box').attr({id: `label-box--${fileIndex[0]}`,for: `item_item_images_attributes_${fileIndex[0]}_image`});
      // indexの値が次の番号にシフトする
      
      // fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  // 画像削除時
  $('#image-box').on('click', '.js-remove', function(){
    // 画像の親要素のカスタムデータ取得
    const targetIndex = $(this).parent().parent().parent().find(".preview-image").data('index');
    // チェックボックスの取得
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // チェックボックスが存在していたら、チェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(`img[data-index="${targetIndex}"]`).remove();
    $(this).parent().parent().parent().remove();
    $(`input[id="item_item_images_attributes_${targetIndex}_image"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

  $('#image-box').on('click', '.edit-btn', function(){
    const targetIndex = $(this).parent().parent().parent().find(".preview-image").data('index');
    $(`input[id="item_item_images_attributes_${targetIndex}_image"]`).click();
  });
  
  $(function(){
    $('#price_calc').on('keyup', function(){
      var data = $('#price_calc').val();
      var profit = Math.round(data * 0.9)
      var fee = (data - profit)
      $('.charge-line_right').html(fee)
      $('.charge-line_right').prepend('¥')
      $('.profit-line_right').html(profit)
      $('.profit-line_right').prepend('¥')
      if(profit == '') {
      $('.charge-line_right').html('ー');
      $('.profit-line_right').html('ー');
      }
    })
  })
});