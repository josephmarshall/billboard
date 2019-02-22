Rails.application.routes.draw do
root "musicboards#index"

resources :musicboards
resources :artists do
  resources :songs
end


#post "musicboard", "musicboards#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
