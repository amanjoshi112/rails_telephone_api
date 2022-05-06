Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'mobiles#index'
  get "/phones", to: "mobiles#index"
  post "/phones", to: "mobiles#special_number"
  post "/phones/:mobile", to:"mobiles#special_number"

end
