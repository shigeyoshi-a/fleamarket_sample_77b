require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録(ユーザー情報)' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,family_nameとfirst_name,family_name_readingとfirst_name_reading,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it " passwordが7文字以上であれば登録できること " do
        @user.password = "0000000"
        @user.password_confirmation = "0000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameがない場合は登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end

      it "emailがない場合は登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it "passwordがあってもpassword_confirmationがない場合は登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "family_nameがない場合は登録できないこと" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors[:family_name]).to include("can't be blank")
      end

      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end

      it "family_name_readingがない場合は登録できないこと" do
        @user.family_name_reading = ""
        @user.valid?
        expect(@user.errors[:family_name_reading]).to include("can't be blank")
      end

      it "first_name_readingがない場合は登録できないこと" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors[:first_name_reading]).to include("can't be blank")
      end

      it "birthdayがない場合は登録できないこと" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors[:birthday]).to include("can't be blank")
      end

      it "passwordが6文字以下では登録できないこと " do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors[:password]).to include("is too short (minimum is 7 characters)")
      end

      it " 重複したemailが存在する場合は登録できないこと " do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
    end
  end
end