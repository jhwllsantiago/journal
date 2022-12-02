Rails.application.routes.draw do
  # /categories/:id/tasks/:id
  resources :categories do
    resources :tasks
  end
  root "pages#home"
  get "about", to: "pages#about"
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
