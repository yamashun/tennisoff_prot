require "rails_helper"

describe Answer do

    it "is valid with answer, user_id and question_id" do
        answer = build(:answer)
        expect(answer).to be_valid
    end

    it "is invalid without answer" do
        answer = build(:answer, answer: nil)
        answer.valid?
        expect(answer.errors[:answer]).to include("を入力してください。")
    end

    it "is invalid without user_id" do
        answer = build(:answer, user: nil)
        # answer = Answer.new(user_id: nil)
        answer.valid?
        expect(answer.errors[:user_id]).to include("を入力してください。")
    end

    it "is invalid without question_id" do
        answer = build(:answer, question: nil)
        answer.valid?
        expect(answer.errors[:question_id]).to include("を入力してください。")
    end


end