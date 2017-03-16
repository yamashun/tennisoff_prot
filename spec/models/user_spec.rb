require "rails_helper"

describe User do

    describe "validation" do
        it "is valid with email, password,  nickname" do
            testuser = build(:user)
            expect(testuser).to be_valid
        end

        it "is invalid without email" do
            testuser = build(:user, email: nil)
            testuser.valid?
            expect(testuser.errors[:email]).to include("を入力してください。")
        end

        it "is invalid without password" do
            testuser = build(:user, password: nil)
            testuser.valid?
            expect(testuser.errors[:password]).to include("を入力してください。")
        end

        it "is invalid with unmatch password_confirmation" do
            testuser = build(:user, password: "pas", password: "pass")
            testuser.valid?
            expect(testuser.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
        end

        it "is invalid without nickname" do
            testuser = build(:user, nickname: nil)
            testuser.valid?
            expect(testuser.errors[:nickname]).to include("を入力してください。")
        end
    end


    describe "follow and unfollow" do

        before :each do
            @taro = create(:user, email: "test@co.jp", nickname: "taro")
            @jiro = create(:user, email: "test2@co.jp", nickname: "jiro")
        end

        describe "follow" do
            it "follows user " do
                @jiro.follow(@taro)
                expect(@taro.followers).to include(@jiro)
            end

            it "returns following user" do
                @jiro.follow(@taro)
                expect(@jiro.following?(@taro)).to eq true
            end
        end

        describe "unfollow" do
            it "unfollows user" do
                @jiro.follow(@taro)
                @jiro.unfollow(@taro)
                expect(@taro.followers).not_to include(@jiro)
            end

            it "returns following user" do
                expect(@jiro.following?(@taro)).to eq false
            end
        end



    end

end