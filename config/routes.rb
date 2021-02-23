Rails.application.routes.draw do


  devise_for :users#, controllers: {
    # sessions: 'users/sessions',
  # registrations: 'users/registrations'
  # }
# devise_for :users


resources :users#, only: [:show, :edit,:update,:index]
resources :books#, only: [:new, :create, :index, :show, :destroy]

root to: 'homes#top'
get "home/about"=>"homes#about",as:"about_home"
# get 'users/show'
# get "users"=>"users#index",as:"index_user"
# get "index"=>"books#index",as:"index_book"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
