require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @user = FactoryBot.create(:user) # テスト用ユーザー
    @recipe = FactoryBot.create(:recipe, user: @user) # テスト用

  end

  describe 'レシピ新規登録' do
    context '新規登録できるとき' do
      it 'レシピ登録できる' do
        expect(@recipe).to be_valid
      end
    end

    context '新規登録できないとき' do

      it 'titleがないと登録できない' do
        @recipe.title = ""
        @recipe.valid?
        expect(@recipe.errors[:title]).to include("can't be blank")
      end

      it 'titleが長すぎると登録できない' do
        @recipe.title = 'a' * 256 # 256文字の文字列を設定
        @recipe.valid?
        expect(@recipe.errors[:title]).to include("is too long (maximum is 255 characters)")
      end

      it 'instructionがないと登録できない' do
        @recipe.instructions = ""
        @recipe.valid?
        expect(@recipe.errors[:instructions]).to include("can't be blank")
      end

      it 'userが紐づいてないと登録できない' do
        @recipe.user_id = ""
        @recipe.valid?
        expect(@recipe.errors[:user]).to include("must exist")
      end

      it '関連する材料も同時に削除される' do
        ingredient_count = @recipe.ingredients.count
        expect { @recipe.destroy }.to change(Ingredient, :count).by(-ingredient_count)
      end

    end

  end
end
