Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users
  root to: 'products#index'
  # resources :users, only: [:create, :index, :edit, :update]
  resources :signup, only: [:index, :create] do
    collection do
      get   'login' # マークアップ作業の為の仮置きっすbyZaki
      get   'registration'
      post  'registration'          =>  'signup#registration_validates'
      get   'sms_authentication'
      post  'sms_authentication'    =>  'signup#sms_authentication_validates'
      get   'sms_confirmation'
      post  'sms_confirmation'      =>  'signup#sms_confirmation_validates'
      get   'address'
      post  'address'               =>  'signup#address_validates'
      get   'creditcard'
      post  'creditcard'           =>  'signup#creditcard_validates'
      get   'done'
    end
  end

  resources :products, only: :new do
    member do
      get 'purchase'
      get 'done'
    end
  end


  resources :mypages, only: :show do
    collection do
      get 'profile'
      get 'card'
      get 'identification'
      get 'logout'
    end
  end
end
