Rails.application.routes.draw do
  # Rewrite the authentication route namin convention
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, skip: [:sessions, :registrations]

  devise_scope :user do
    post '/users/sign_in', to: 'users/sessions#create'
    delete '/users/sign_out', to: 'users/sessions#destroy'
    post '/users/sign_up', to: 'users/registrations#create'
  end

  get '/entries', to: 'entries#index'
  post '/create_entry', to: 'entries#create'
  put '/update_entry', to: 'entries#update'
  delete '/delete_entry', to: 'entries#destroy'

  post '/add_friends', to: 'homes#add_friends'
  delete '/delete_friends', to: 'homes#delete_friends'

  get '/home', to: 'homes#index'
end
