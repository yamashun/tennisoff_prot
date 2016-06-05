# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".datepicker").datepicker(
    dateFormat: 'yy-mm-dd'
  )



$(document).on 'ready page:load', -> # turbolinks対策
  ### 郵便番号入力フォーム：数値のみの入力 ###
  $('#address_postal_code').keydown ->
    presskey = String.fromCharCode(event.keyCode);
    event.returnValue = /[0-9\b\t\n]/.test(presskey) # 入力受付キーを正規表現で指定

  ### 住所取得ボタン：Ajaxで住所取得 ###
  $('#getarea-button').click ->
    postalcode = $('#address_postal_code').val()
    if postalcode.length != 7
      $("#postalcode-result").css("color","#ff0000").html("郵便番号は７桁です。")
      return false
    $.ajax
      async:    true                             # true:非同期通信
      url:      "/off_meetings/get_areas/"
      type:     "GET"
      data:     {search_code: postalcode}
      dataType: "json"
      context:  this
      error: (jqXHR, textStatus, errorThrown) -> # 通信/サーバエラーなど
        $("#postalcode-result").css("color","#ff0000").html(errorThrown)
      success:  (data, textStatus, jqXHR) ->
        if data?                                 # 対象あり
          $("#address").val(data.prefectural + data.city + data.street)                  # 市区町村名更新
        else                                     # 対象なし
          $("#postalcode-result").css("color","#ff0000").html("未登録の郵便番号です。")

  ### MSGのリセット ###
  $('.address').change -> $("#postalcode-result").html("")