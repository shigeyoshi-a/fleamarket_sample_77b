require 'rails_helper'
describe Item do

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item_image = FactoryBot.build(:item_image)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "全ての情報が記載されていれば出品できること" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "商品名がないと出品できないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors[:name]).to include("を入力してください")
      end

      it "商品の説明がないと出品できないこと" do
        @item.description = ""
        @item.valid?
        expect(@item.errors[:description]).to include("を入力してください")
      end

      it "カテゴリー情報がないと出品できないこと" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors[:category]).to include("を入力してください")
      end

      it "ブランド名がなくても出品できること" do
        @item.brand = ""
        expect(@item).to be_valid
      end

      it "商品の状態についての情報がないと出品できないこと" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors[:condition_id]).to include("を入力してください")
      end

      it "配送料の負担についての情報がないと出品できないこと" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors[:delivery_fee_id]).to include("を入力してください")
      end

      it "発送元の地域についての情報がないと出品できないこと" do
        @item.sending_area_id = ""
        @item.valid?
        expect(@item.errors[:sending_area_id]).to include("を入力してください")
      end

      it "発送までの日数についての情報がないと出品できないこと" do
        @item.sending_days_id = ""
        @item.valid?
        expect(@item.errors[:sending_days_id]).to include("を入力してください")
      end

      it "価格がないと出品できないこと" do
        @item.price = ""
        @item.valid?
        expect(@item.errors[:price]).to include("を入力してください")
      end
    end

    describe '商品編集機能' do
      context '商品編集がうまくいくとき' do
        it "全ての情報が記載されていれば更新できること" do
          item_params = FactoryBot.attributes_for(:item)
          expect(@item.update(item_params)).to be_truthy
        end
      end
  
      context '商品編集がうまくいかないとき' do
        it "商品名がないと出品できないこと" do
        end
  
        it "商品の説明がないと出品できないこと" do
        end
  
        it "カテゴリー情報がないと出品できないこと" do
        end
  
        it "ブランド名がなくても出品できること" do
        end
  
        it "商品の状態についての情報がないと出品できないこと" do
        end
  
        it "配送料の負担についての情報がないと出品できないこと" do
        end
  
        it "発送元の地域についての情報がないと出品できないこと" do
        end
  
        it "発送までの日数についての情報がないと出品できないこと" do
        end
  
        it "価格がないと出品できないこと" do
        end
      end
    end
  end
end