require "rails_helper"

describe Relationship do

    it "is valid with follower_id and followed_id" do
        relationship = build(:relationship)
        expect(relationship).to be_valid
    end

    it "is invalid without follower_id" do
        relationship = Relationship.new(follower_id: nil)
        relationship.valid?
        expect(relationship.errors[:follower_id]).to include("を入力してください。")
    end

    it "is invalid without followed_id" do
        relationship = Relationship.new(followed_id: nil)
        relationship.valid?
        expect(relationship.errors[:followed_id]).to include("を入力してください。")
    end

    it "dose not allow duplicate relationship about followed_id and follower_id" do
        create(:relationship, follower_id: 1, followed_id: 2)
        relationship = build(:relationship)
        relationship.valid?
        expect(relationship.errors[:follower_id]).to include("はすでに存在します。")
    end
end