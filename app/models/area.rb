class Area < ActiveRecord::Base
  belongs_to :prefectural

  # 郵便番号に応じてJSONで渡すHashデータを取得するメソッド
  def self.search_area(search_code)
    areas = self.where("postal_code = ?", search_code)
    if areas.empty?                     # 該当なし
      resp_hash = nil
    else                                # 該当あり
      area_info = areas.first
      areas.drop(1).each do |next_area| # 該当が複数あれば不要な情報を削る
        area_info.prefectural_id = 0 if area_info.prefectural_id != next_area.prefectural_id
        area_info.city   = self.samestr(area_info.city, next_area.city)
        area_info.street = self.samestr(area_info.street, next_area.street)
      end
      ### 返却データの整形 ###
      resp_hash = area_info.attributes  # 編集出来るようにHashとして取得
      resp_hash.merge!(prefectural: area_info.prefectural.name)
      resp_hash.delete("id")            # 返却不要な要素の削除
      resp_hash.delete("postal_code")
    end
    return resp_hash
  end

  private
    # ２つの文字列の始めから同じ部分を取得するメソッド
    def self.samestr(str1, str2)
      return "" if str1.nil? || str2.nil?                # レコードの空要素を読んだ時のnil避け
      samechars = ""
      str1, str2 = str2, str1 if str1.length > str2.length # 最大でも小さい方の最後までしか比較しない
      0.upto(str1.length-1) do |index|
        str1[index] == str2[index] ? samechars += str1[index] : break
      end
      return samechars
    end

end
