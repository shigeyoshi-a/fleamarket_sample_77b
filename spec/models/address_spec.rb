require 'rails_helper'
describe Address do
  before do
    @address = FactoryBot.build(:address)
  end
  describe 'ユーザー新規登録(アドレス情報)' do
    context '新規登録がうまくいくとき' do
      it "post_codeが７文字だと登録できること" do
        @address.post_code = "1234567"
        expect(@address).to be_valid
      end

      it "municipalityが全角である場合は登録できること" do
        @address.municipality = "あア阿ａA１"
        expect(@address).to be_valid
      end

      it "receiving_family_nameが全角である場合は登録できること" do
        @address.receiving_family_name = "あア阿ａA１"
        expect(@address).to be_valid
      end
  
      it "receiving_first_name が全角である場合は登録できること" do
        @address.receiving_first_name = "あア阿ａA１"
        expect(@address).to be_valid
      end

      it "apartment_nameがない場合でも登録できる" do
        @address.apartment_name = ""
        expect(@address).to be_valid
      end

      it "telephone_nemberがない場合でも登録できる" do
        @address.telephone_number = ""
        expect(@address).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "post_codeがない場合は登録できないこと" do
        @address.post_code = ""
        @address.valid?
        expect(@address.errors[:post_code]).to include("can't be blank")
      end

      it "post_codeが７文字以外だと登録できないこと" do
        @address.post_code = "123456"
        @address.valid?
        expect(@address.errors[:post_code]).to include("is the wrong length (should be 7 characters)")
      end
  
      it "prefecture_idがない場合は登録できないこと" do
        @address.prefecture_id = ""
        @address.valid?
        expect(@address.errors[:prefecture_id]).to include("can't be blank")
      end

      it "municipalityがない場合は登録できないこと" do
        @address.municipality= ""
        @address.valid?
        expect(@address.errors[:municipality]).to include("can't be blank")
      end

      it "street_numberがない場合は登録できないこと" do
        @address.street_number = ""
        @address.valid?
        expect(@address.errors[:street_number]).to include("can't be blank")
      end

      it "receiving_family_nameがない場合は登録できないこと" do
        @address.receiving_family_name = ""
        @address.valid?
        expect(@address.errors[:receiving_family_name]).to include("can't be blank")
      end

      it "receiving_first_name がない場合は登録できないこと" do
        @address.receiving_first_name = ""
        @address.valid?
        expect(@address.errors[:receiving_first_name ]).to include("can't be blank")
      end
  
      it "receiving_family_name_readingがない場合は登録できないこと" do
        @address.receiving_family_name_reading = ""
        @address.valid?
        expect(@address.errors[:receiving_family_name_reading]).to include("can't be blank")
      end
  
      it "receiving_first_name_readingがない場合は登録できないこと" do
        @address.receiving_first_name_reading = ""
        @address.valid?
        expect(@address.errors[:receiving_first_name_reading]).to include("can't be blank")
      end
    end
  end
end