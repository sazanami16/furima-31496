require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/test_image.png')
    end

    describe '商品出品機能' do
      context '商品情報の登録がうまくいくとき' do
        it '各項目が全て存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品情報の登録がうまくいかないとき' do
        it '出品画像が空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品説明が空では登録できない' do
          @item.text = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end
        it "カテゴリーが'--'では登録できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category Select')
        end
        it "商品の状態が'--'空では登録できない" do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition Select')
        end
        it "配送料の負担が'--'では登録できない" do
          @item.fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Fee Select')
        end
        it "発送元の地域が'--'では登録できない" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture Select')
        end
        it "発送までの日数が'--'では登録できない" do
          @item.send_time_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Send time Select')
        end
        it '価格が空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格が300円未満では登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end
        it '価格が10,000,000円以上では登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end
        it '価格が半角数字以外は登録できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Half-width number')
        end
      end
    end
  end
end
