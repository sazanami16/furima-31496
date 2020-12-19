require 'rails_helper'
RSpec.describe User, type: :model do
  describe User do
   before do
      @user = FactoryBot.build(:user)
   end

   describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "各項目が全て存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは＠がないと登録できない" do
        @user.email = "k0123com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "k0123"
        @user.password_confirmation = "k0123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字のみの場合は登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが英字のみの場合は登録できない" do
        @user.password = "kkkkkk"
        @user.password_confirmation = "kkkkkk"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "苗字が空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "苗字が半角英数字では登録できない" do
        @user.last_name = 'ito01'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it "名前が空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名前が半角英数字では登録できない" do
        @user.first_name = 'taishi02'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "苗字のカナが空では登録できない" do
        @user.last_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last reading can't be blank")
      end
      it "苗字のカナが半角英数字では登録できない" do
        @user.last_reading = 'ito'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last reading kana Full-width katakana characters")
      end
      it "苗字のカナが平仮名では登録できない" do
        @user.last_reading = 'いとう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last reading kana Full-width katakana characters")
      end
      it "苗字のカナが漢字では登録できない" do
        @user.last_reading = '伊藤'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last reading kana Full-width katakana characters")
      end
      it "名前のカナが空では登録できない" do
        @user.first_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First reading can't be blank")
      end
      it "名前のカナが半角英数字では登録できない" do
        @user.first_reading = 'taishi'
        @user.valid?
        expect(@user.errors.full_messages).to include("First reading kana Full-width katakana characters")
      end
      it "名前のカナが平仮名では登録できない" do
        @user.first_reading = 'たいし'
        @user.valid?
        expect(@user.errors.full_messages).to include("First reading kana Full-width katakana characters")
      end
      it "名前のカナが漢字では登録できない" do
        @user.first_reading = '大志'
        @user.valid?
        expect(@user.errors.full_messages).to include("First reading kana Full-width katakana characters")
      end
      it "生年月日が空では登録できない" do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
   end
  end
end