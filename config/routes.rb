JbappV2::Application.routes.draw do
	resources :meterstanden do
		#dit is nodig om een extra action toe te voegen
		collection do
			get 'winter'
  		end
	end

    resources :categories
    
	resources :websites
    
	resources :notities
    
	resources :aankopen do
    	resources :onderhouden
  	end
   	
	resources :onderhouden
    
	root "pages#home"    
    
	get "home", to: "pages#home", as: "home"
    get "inside", to: "pages#inside", as: "inside"
	
	get ":filter/notities", :to => "notities#index" #voor de filter bij de notities maar werkt blijkbaar ook zonder deze lijn zie aankopen
    
    devise_for :users
  
    namespace :admin do
        root "base#index"
        resources :users
    end
end
