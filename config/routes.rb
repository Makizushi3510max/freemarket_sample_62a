Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  # resources :users, only: [:create, :index, :edit, :update]
  resources :signup, only: [:index, :create] do
    collection do
      get 'login' # マークアップ作業の為の仮置きっすbyZaki
      get 'registration'
      get 'sms_authentication'
      get 'sms_confirmation'
      get 'address'
      get 'creditcard'
      get 'done'
    end
  end
end
