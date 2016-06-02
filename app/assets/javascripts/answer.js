function ready() {
    // 「.modal-open」をクリック
        $('.modal-open').on("click", function(){
            console.log("ボタンが押されました。");
            // オーバーレイ用の要素を追加
            $('body').append('<div class="modal-overlay"></div>');
            // オーバーレイをフェードイン
            $('.modal-overlay').fadeIn('slow');

            // モーダルコンテンツのIDを取得
            var modal = '#' + $(this).attr('data-target');
            var question_id = $(this).attr('question-id');
            // モーダルコンテンツの表示位置を設定
            modalResize();
             // モーダルコンテンツフェードイン
            $(modal).fadeIn('slow');

            // 「.modal-overlay」あるいは「.modal-close」をクリック
            $('.modal-overlay, .modal-close').off().click(function(){
                // モーダルコンテンツとオーバーレイをフェードアウト
                $(modal).fadeOut('slow');
                $('.modal-overlay').fadeOut('slow',function(){
                    // オーバーレイを削除
                    $('.modal-overlay').remove();
                });
            });

            // リサイズしたら表示位置を再取得
            $(window).on('resize', function(){
                modalResize();
            });

            // モーダルコンテンツの表示位置を設定する関数
            function modalResize(){
                // ウィンドウの横幅、高さを取得
                var w = $(window).width();
                var h = $(window).height();

                // モーダルコンテンツの表示位置を取得
                var x = (w - $(modal).outerWidth(true)) / 2;
                var y = (h - $(modal).outerHeight(true)) / 2;

                // モーダルコンテンツの表示位置を設定
                $(modal).css({'left': x + 'px','top': y + 'px'});
            }

        });
}

function toolchip_test(){
    $('#def').darkTooltip();
    $('#def-html').darkTooltip({
    opacity:1,
    gravity:'west'
    });
}


//非Turbolinks遷移時
$(document).ready(ready);
// $(document).ready(toolchip_test);

//Turbolinks遷移時
$(document).on('page:load', ready);
// $(document).on('page:load', toolchip_test);




// $(document).on('page:load', ready)