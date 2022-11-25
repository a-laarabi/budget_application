Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :records, only: [ :new, :show, :create, :destroy]
  end


  authenticated :user do
    root :to => 'categories#index', as: :authenticated_root
  end

  root to: 'splash#index' 
end
