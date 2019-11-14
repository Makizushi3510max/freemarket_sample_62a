Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'

  resources :signup do
    collection do
      get 'registration'
      get 'sms_authentication'
      get 'sms_confirmation'
      get 'address'
      get 'creditcard'
      get 'done'
    end
  end
end
