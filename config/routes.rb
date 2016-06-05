Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :trainers
  devise_for :clients

  resources :events

  get "/faq" 		=> "static_pages#faq"
  get "/profile" 	=> "users#profile"
  get "/payment" 	=> "users#payment"
  get "/stats" 		=> "users#stats"
  
end
