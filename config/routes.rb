Rails.application.routes.draw do

  resources :informations, :only => [:new, :create, :edit, :update, :destroy]

  devise_for :managers
  
  resources :managers do
    resources :events, :only => [:new, :create, :edit, :update, :destroy]
  end

  resources :events, :only => [:index, :show]

  devise_for :companies

  devise_for :users
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
