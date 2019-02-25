Rails.application.routes.draw do
  devise_for :users
root "musicboards#index"

resources :musicboards
resources :artists do
  resources :songs
end

get 'artists/comp', 'artists#comp'
post 'musicboards/generate_test_data', 'musicboards#generate_test_data'
post 'musicboards/delete_all_data', 'musicboards/delete_all_data'
#post "musicboard", "musicboards#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
