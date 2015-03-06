JbappV2::Application.routes.draw do
  get 'aankopen/index'

    resources :categories
    resources :websites
    resources :notities
	resources :aankopen
    
    root "pages#home"    
    get "home", to: "pages#home", as: "home"
    get "inside", to: "pages#inside", as: "inside"
	get ":filter/notities", :to => "notities#index"
    
    devise_for :users
  
    namespace :admin do
        root "base#index"
        resources :users
    end
end
