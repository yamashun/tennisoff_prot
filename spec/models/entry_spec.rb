require "rails_helper"

describe Entry do

    it "is valid off_meeting_id and user_id" do
        entry = build(:entry)
        # entry = Entry.new(off_meeting_id: 1, user_id: 10)
        expect(entry).to be_valid
    end

    it "is invalid without off_meeting_id" do
        entry = build(:entry, off_meeting_id: nil)
        # entry = Entry.new(off_meeting_id: nil)
        entry.valid?
        expect(entry.errors[:off_meeting_id]).to include("を入力してください。")
    end

    it "is invalid without user_id" do
        entry = build(:entry, user_id: nil)
        # entry = Entry.new(user_id: nil)
        entry.valid?
        expect(entry.errors[:user_id]).to include("を入力してください。")
    end

end