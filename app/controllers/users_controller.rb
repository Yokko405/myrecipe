class UsersController < ApplicationController
  def show

    # ログインユーザーのレシピを取得する
    if signed_in?
      @recipes = current_user.recipes
    else
      redirect_to root_path, alert: 'ログインが必要です。'
    end
  end

end
