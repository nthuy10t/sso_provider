Rails.application.routes.draw do
  root 'home#index'
  resources :clients do
    collection do
      get 'open_tab'
    end    
  end
  resources :auth_infors
  devise_for :users, controllers: {sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/auth/sso/authorize', to: "auth#authorize", via: :all
  match '/auth/sso/get_access_token', to: "auth#get_access_token", via: :all

  match '/auth/sso/get_info_user', to: "auth#get_info_user", via: :all

  match '/oauth/token', to: "auth#get_access_token", via: :all
  
end
