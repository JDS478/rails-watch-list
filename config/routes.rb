Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "lists#index"
  resources :lists, only: %i[new show create index] do
    resources :bookmarks, only: %i[index new create]
  end
  resources :bookmarks, only: %i[destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
