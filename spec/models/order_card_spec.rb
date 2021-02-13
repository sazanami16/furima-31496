require 'rails_helper'

RSpec.describe OrderCard, type: :model do
  describe OrderCard do
    before do
      @order_card = FactoryBot.build(:order_card)
    end

    describe '商品購入機能' do
      context '購入情報の登録がうまくいくとき' do
        it '各項目が全て存在すれば登録できる' do
          expect(@order_card).to be_valid
        end
      end

      context '商品情報の登録がうまくいかないとき' do
        it "tokenが空では登録できないこと" do
          @order_card.token = nil
          @order_card.valid?
          expect(@order_card.errors.full_messages).to include("Token can't be blank")
        end
        it '郵便番号が空だと登録できない' do
          @order_card.postal_code = ''
          @order_card.valid?
          expect(@order_card.errors.full_messages).to include("Postal code can't be blank")
        end
        it '郵便番号にハイフンが含まれていないと登録できない' do
          @order_card.postal_code = '1231234'
          @order_card.valid?
          expect(@order_card.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it "都道府県が'--'では登録できない" do
          @order_card.prefecture_id = 1
          @order_card.valid?
          expect(@order_card.errors.full_messages).to include('Prefecture Select')
        end
        it '市区町村が空だと登録できない' do
          @order_card.city = nil
          @order_card.valid?
          expect(@order_card.errors.full_messages).to include("City can't be blank")
        end
        it '番地が空だと登録できない' do
          @order_card.address = nil
          @order_card.valid?
          expect(@order_card.errors.full_messages).to include("Address can't be blank")
        end
        it '電話番号が空だと登録できない' do
          @order_card.phone_number = nil
          @order_card.valid?
          expect(@order_card.errors.full_messages).to include("Phone number can't be blank")
        end
      end
    end
  end
end
