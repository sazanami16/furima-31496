require 'rails_helper'

RSpec.describe OrderCard, type: :model do
  describe OrderCard do
    before do
      @user = User.new(id: 1)
      @item = Item.new(id: 1)
      @order_card = FactoryBot.build(
        :order_card, 
        :user_id => @user.id, 
        :item_id => @item.id
      )
      sleep 0.1
    end

    describe '商品購入機能' do
      context '購入情報の登録がうまくいくとき' do
        it '各項目(建物名以外)が全て存在すれば登録できる' do
          expect(@order_card).to be_valid
        end

        it '建物名は空でも登録できる' do
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
        it '電話番号は12桁以上だと登録できない' do
          @order_card.phone_number = '090123412345'
          @order_card.valid?
          expect(@order_card.errors.full_messages).to include("Phone number Input only number")
        end
        it '電話番号は英数字混合だと登録できない' do
          @order_card.phone_number = '090aaaa1234'
          @order_card.valid?
          expect(@order_card.errors.full_messages).to include("Phone number Input only number")
        end
        it 'user_idが空だと登録できない' do
          @order_card.user_id = nil
          @order_card.valid?
          expect(@order_card.errors[:user_id]).to include("can't be blank")
        end
        it 'item_idが空だと登録できない' do
          @order_card.item_id = nil
          @order_card.valid?
          expect(@order_card.errors[:item_id]).to include("can't be blank")
        end
      end
    end
  end
end
