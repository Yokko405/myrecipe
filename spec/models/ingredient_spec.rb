require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @user = FactoryBot.create(:user) # テスト用ユーザー
    @recipe = FactoryBot.create(:recipe, user: @user) # テスト用
    @ingredient = FactoryBot.create(:ingredient, recipe: @recipe) # テスト用
  end

  describe 'ingredient新規登録' do
    context '新規登録できるとき' do
      it '材料登録できる' do
        expect(@ingredient).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameがないと登録できない' do
        @ingredient.name = ''
        @ingredient.valid?
        expect(@ingredient.errors[:name]).to include("can't be blank")
      end

      it 'quantityがないと登録できない' do
        @ingredient.quantity = ''
        @ingredient.valid?
        expect(@ingredient.errors[:quantity]).to include("can't be blank")
      end

      it 'recipeが紐づいてないと登録できない' do
        @ingredient.recipe_id = ''
        @ingredient.valid?
        expect(@ingredient.errors[:recipe]).to include('must exist')
      end
    end
  end
end
