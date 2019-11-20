Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'products#index'
  # resources :users, only: [:create, :index, :edit, :update]
  resources :signup, only: [:index, :create] do
    collection do
      get   'login' # マークアップ作業の為の仮置です by E07ZK
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
end
