Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'users/registrations' }
  root to: 'products#index'
  # resources :users, only: [:create, :index, :edit, :update]
  resources :signup, only: [:index, :create] do
    collection do
      get   'index'
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

  post 'confirm'  => 'purchase#confirm'
  post 'pay'      => 'purchase#pay'
  get  'done'     => 'purchase#done'

  resources :products, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'get_category_roots'
      get 'get_category_children'
      get 'get_category_grandchildren'
      post 'post_image'
    end
  end

  resources :mypages, only: :show do
    collection do
      get 'profile'
      get 'card'
      get 'card_registration'
      post 'card_registration'  =>  'mypages#creditcard_validates'
      get 'identification'
      get 'logout'
    end
  end
end