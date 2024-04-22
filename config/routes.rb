Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'recipes#index'

  # ユーザーのマイページへのルート
  get 'mypage', to: 'users#show'

  resources :recipes

end
