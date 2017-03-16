require "rails_helper"

describe Question do

    it "is valid with question, user_id, off_meeting_id" do
        question = build(:question)
        expect(question).to be_valid
    end

    it "is invalid without question" do
        question = build(:question, question: nil)
        question.valid?
        expect(question.errors[:question]).to include("を入力してください。")
    end

    it "is invalid without user_id" do
        question = build(:question, user: nil)
        question.valid?
        expect(question.errors[:user_id]).to include("を入力してください。")
    end

    it "is invalid without off_meeting_id" do
        # question = build(:question, off_meeting_id: nil)
        question = build(:question, off_meeting: nil)
        question.valid?
        expect(question.errors[:off_meeting_id]).to include("を入力してください。")
    end

end