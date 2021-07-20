// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
/*global $*/

// 貯金診断ページのカウント
$(document).on('turbolinks:load', function() {
    $('input:checkbox').change(function() {
        let cnt = $('#checkList input:checkbox:checked').length;
        $('div.total').text('選択：' + cnt + '個');
    }).trigger('change');
});


// 投資診断モーダル
$(document).on('turbolinks:load', function() {
    // 安定した収入がある
  $('#question1-yes-show').click(function() {
    $('.time-modal').fadeIn();
  });
  $('#question1-no-show').click(function() {
    $('.life-modal').fadeIn();
  });
    // 忙しいので時間をかけたくない
  $('#question2-yes-show').click(function() {
    $('.down-modal').fadeIn();
  });
  $('#question2-no-show').click(function() {
    $('.company-modal').fadeIn();
  });
    // 生活の予備資金がある
  $('#question3-yes-show').click(function() {
    $('.company-modal').fadeIn();
  });
  $('#question3-no-show').click(function() {
    $('.regular-modal').fadeIn();
  });
    // 値下がりしても落ち着いていられる
  $('#question4-yes-show').click(function() {
    $('.trust-modal').fadeIn();
  });
  $('#question4-no-show').click(function() {
    $('.deposit-modal').fadeIn();
  });
    // 業績を調べるのが好き
  $('#question5-yes-show').click(function() {
    $('.stock-modal').fadeIn();
  });
  $('#question5-no-show').click(function() {
    $('.asset-modal').fadeIn();
  });
    // つみたて預金をしている
  $('#question6-yes-show').click(function() {
    $('.nisa-modal').fadeIn();
  });
  $('#question6-no-show').click(function() {
    $('.deposit-modal').fadeIn();
  });
    // もう一度診断するために全部フェードアウト
  $('.close-modal').click(function(){
    $('.time-modal').fadeOut();
    $('.life-modal').fadeOut();
    $('.down-modal').fadeOut();
    $('.company-modal').fadeOut();
    $('.regular-modal').fadeOut();
    $('.trust-modal').fadeOut();
    $('.deposit-modal').fadeOut();
    $('.stock-modal').fadeOut();
    $('.asset-modal').fadeOut();
    $('.nisa-modal').fadeOut();
    $('.deposit-modal').fadeOut();
  });
});


// フラッシュメッセージを消す
$(document).on('turbolinks:load', function(){
  setTimeout("$('.flash').fadeOut('slow')", 2000);
});


// topページ移動
//スクロールした際の動きを関数でまとめる
$(document).on('turbolinks:load', function(){
  function PageTopAnime() {
      let scroll = $(window).scrollTop(); //スクロール値を取得
      if (scroll >= 200){//200pxスクロールしたら
        $('#page-top').removeClass('DownMove');   // DownMoveというクラス名を除去して
        $('#page-top').addClass('UpMove');      // UpMoveというクラス名を追加して出現
      }else{//それ以外は
        if($('#page-top').hasClass('UpMove')){//UpMoveというクラス名が既に付与されていたら
          $('#page-top').removeClass('UpMove'); //  UpMoveというクラス名を除去し
          $('#page-top').addClass('DownMove');  // DownMoveというクラス名を追加して非表示
        }
      }
      let wH = window.innerHeight; //画面の高さを取得
      let footerPos =  $('#footer').offset().top; //footerの位置を取得
      if(scroll+wH >= (footerPos+10)) {
        let pos = (scroll+wH) - footerPos+10 //スクロールの値＋画面の高さからfooterの位置＋10pxを引いた場所を取得し
        $('#page-top').css('bottom',pos); //#page-topに上記の値をCSSのbottomに直接指定してフッター手前で止まるようにする
      }else{//それ以外は
        if($('#page-top').hasClass('UpMove')){//UpMoveというクラス名がついていたら
          $('#page-top').css('bottom','10px');// 下から10pxの位置にページリンクを指定
        }
      }
  }
  // 画面をスクロールをしたら動かしたい場合の記述
  $(window).scroll(function () {
    PageTopAnime();/* スクロールした際の動きの関数を呼ぶ*/
  });
  // #page-topをクリックした際の設定
  $('#page-top').click(function () {
      $('body,html').animate({
          scrollTop: 0//ページトップまでスクロール
      }, 1000);//ページトップスクロールの速さ。数字が大きいほど遅くなる
      return false;//リンク自体の無効化
  });
});


// 投稿文字数表示
$(document).on('turbolinks:load', function(){
  // 処理（ページが読み込まれた時、フォームに残り何文字入力できるかを数えて表示する）

  //フォームに入力されている文字数を数える
  //\nは"改行"に変換して2文字にする。オプションフラグgで文字列の最後まで\nを探し変換する
  let count = $(".js-text").text().replace(/\n/g, "改行").length;
  //残りの入力できる文字数を計算
  let now_count = 300 - count;
  //文字数がオーバーしていたら文字色を赤にする
  if (count > 300) {
    $(".js-text-count").css("color","red");
  }
  //残りの入力できる文字数を表示
  $(".js-text-count").text( "残り" + now_count + "文字");

  $(".js-text").on("keyup", function() {
    // 処理（キーボードを押した時、フォームに残り何文字入力できるかを数えて表示する）
    //フォームのvalueの文字数を数える
    let count = $(this).val().replace(/\n/g, "改行").length;
    let now_count = 300 - count;

    if (count > 300) {
      $(".js-text-count").css("color","red");
    } else {
      $(".js-text-count").css("color","black");
    }
    $(".js-text-count").text( "残り" + now_count + "文字");
  });
});


// 空欄で検索を押したらアラートを表示する
$(document).on('turbolinks:load', function() {
  // submit()に関数をバインド
  $('#form').submit(function() {
    // もしテキストボックスが空欄だったら…
    if($('.text-field').val() == '') {
      // 警告を出す
      alert('空欄です！');
      // 処理を中断
      return false;
    }
  });
});


// コメントモーダル表示
$(document).on('turbolinks:load', function() {
  $(".modal-show").modaal({
  	overlay_close:true,//モーダル背景クリック時に閉じるか
  	hide_close: true, // 閉じるボタンを隠す
  });
});