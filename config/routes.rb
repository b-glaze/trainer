Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  resources :events

  get "/faq" 		=> "static_pages#faq"
  get "/profile" 	=> "users#profile"
  get "/payment/:id" 	=> "events#payment",  as: "payment"
  post "/payment/:id"	=> "events#sendpayment"
  
end
