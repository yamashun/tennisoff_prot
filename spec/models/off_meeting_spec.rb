# == Schema Information
#
# Table name: off_meetings
#
#  id                  :integer          not null, primary key
#  day                 :date
#  address             :string(255)
#  level               :string(255)
#  detail              :text(65535)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  summary             :string(255)
#  num_of_persons      :integer
#  user_id             :integer
#  address_postal_code :string(255)
#  latitude            :float(24)
#  longitude           :float(24)
#

require "rails_helper"

describe OffMeeting do

    # 日付、住所、タイトル、ユーザーID、levelがあれば有効であること
    it "valid with a day, address, summary, and user_id" do
        expect(build(:off_meeting)).to be_valid
    end

    # 日付がなければ無効であること
    it "is invalid without a day" do
        off_meeting = build(:off_meeting, day: nil)
        off_meeting.valid?
        expect(off_meeting.errors[:day]).to include("を入力してください。")
    end

    # 住所がなければ無効であること
    it "is invalid without a address" do
        off_meeting = build(:off_meeting, address: nil)
        off_meeting.valid?
        expect(off_meeting.errors[:address]).to include("を入力してください。")
    end

    # タイトルがなければ無効であること
    it "is invalid without a summary" do
        off_meeting = build(:off_meeting, summary: nil)
        off_meeting.valid?
        expect(off_meeting.errors[:summary]).to include("を入力してください。")
    end

    # ユーザーIDがなければ無効であること
    it "is invalid without a user_id" do
        off_meeting = build(:off_meeting, user_id: nil)
        off_meeting.valid?
        expect(off_meeting.errors[:user_id]).to include("を入力してください。")
    end

    # 住所が101文字以上の場合無効であること 文字以内で入力してください。
    it "is invalid with number of character over 101" do
        off_meeting = build(:off_meeting, address: "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901")
        off_meeting.valid?
        expect(off_meeting.errors[:address]).to include("は100文字以内で入力してください。")
    end

    # 住所が100文字の場合有効であること
    it "is valid with 100 character" do
        off_meeting = build(:off_meeting, address: "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
        expect(off_meeting).to be_valid
    end

    # タイトルが81文字以上の場合無効であること
    it "is invalid with number of character over 61" do
        off_meeting = build(:off_meeting, summary: "あいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあ")
        off_meeting.valid?
        expect(off_meeting.errors[:summary]).to include("は80文字以内で入力してください。")
    end

    # タイトルが60文字の場合有効であること
    it "is valid with 60 character" do
        off_meeting = build(:off_meeting, summary: "あいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこあいうえおかきくけこ")
        expect(off_meeting).to be_valid
    end

    # レベルの値が指定した文字列に含まれれば有効であること
    it "is valid with include level array" do
        off_meeting = build(:off_meeting, level: "1")
        expect(off_meeting).to be_valid
    end

    # レベルの値が指定した文字列に含まれなければ無効であるこ
    it "is invalid with exclude level array" do
        off_meeting = build(:off_meeting, level: "5")
        off_meeting.valid?
        expect(off_meeting.errors[:level]).to include("は一覧にありません。")
    end

    # 人数が自然数の場合有効であること
    it "is valid with integer" do
        off_meeting = build(:off_meeting, num_of_persons: 5)
        expect(off_meeting).to be_valid
    end

    # 人数が負の値の場合無効であること
    it "is invalid with negative number" do
        off_meeting = build(:off_meeting, num_of_persons: -1)
        off_meeting.valid?
        expect(off_meeting.errors[:num_of_persons]).to include("は0より大きい値にしてください。")
    end

    # 人数が負の値の場合無効であること
    it "is invalid with negative number" do
        off_meeting = build(:off_meeting, num_of_persons: 2.1)
        off_meeting.valid?
        expect(off_meeting.errors[:num_of_persons]).to include("は整数で入力してください。")
    end

    # 人数が文字列の場合無効であること
    it "is invalid with string" do
        off_meeting = build(:off_meeting, num_of_persons: "test")
        off_meeting.valid?
        expect(off_meeting.errors[:num_of_persons]).to include("は数値で入力してください。")
    end

    describe "convert level" do
        # 1から4の文字に対して適切なレベルを返すこと
        it "returns a level as a string" do
            off_meeting = build(:off_meeting, level: "3")
            expect(off_meeting.level_convert).to eq "上級"
        end

        # 1から4以外の文字に対してフリーを返すこと
        it "returns a free level as a string when out of array" do
            off_meeting = build(:off_meeting, level: "10")
            expect(off_meeting.level_convert).to eq "フリー"
        end
    end

end
