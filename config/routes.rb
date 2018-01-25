Rails.application.routes.draw do
  use_doorkeeper
  resources :books
  root :to => "home#home"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about' => 'home#about'
  get 'help' => 'home#help'

  resources :users do
	  get :avatar, on: :member
	end
	resources :books do
		resources :reviews
	end

  #api routes
  namespace :api do
    namespace :v1 do
      resources :books
    end
  end
end
