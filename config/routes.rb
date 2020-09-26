Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "welcome#index"
  
  get "welcome/index" => "welcome#index"
  get "welcome" => "welcome#index"
  get "/" => "welcome#index"

  resources :events

end
