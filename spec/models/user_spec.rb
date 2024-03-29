require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ユーザー登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'usernameが空では登録できない' do
        @user.username = '' # userameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Username can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = '' # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailが重複していると登録できない' do
        anotheruser = FactoryBot.create(:user)
        @user.email = anotheruser.email
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@を含まない場合は登録できない' do
        @user.email = 'EMAIL.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空では登録できない' do
        @user.password = '' # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = 'pas12'
        @user.password_confirmation = 'pas12'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'Applered'
        @user.password_confirmation = 'Applered'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合で入力してください。'
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください。')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'passワード1234'
        @user.password_confirmation = 'passワード1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください。')
      end
      it 'passwordとpassword_confirmationが一致しない場合は登録できない' do
        @user.password = 'PASSWORD1'
        @user.password_confirmation = 'PASSWORD2'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end
end
