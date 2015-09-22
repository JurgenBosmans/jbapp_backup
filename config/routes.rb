JbappV2::Application.routes.draw do
  
  resources :todos do
    resources :todo_items do
    	member do
        patch :afgewerkt
    	end
    end
    
    member do
      patch :kopieer
    end
  end
  
  
	resources :soort_prestaties
	
	resources :prestaties do
		resources :personen
		resources :soort_prestaties
	end
		
	resources :producten
	resources :tips
  
	resources :recepten do
		resources :bereidingen
		collection do
			get 'ingredient'
		end
	end

	resources :bereidingen
	
	resources :dossiers do
		resources :personen
	end
	
	resources :personen
	
	resources :artsen
	
	resources :meterstanden do
		#dit is nodig om een extra action toe te voegen
		collection do
			get 'winter'
			get 'vergelijk'
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
  get "about", to: "pages#about", as: "about"
    get "inside", to: "pages#inside", as: "inside"
	
	get ":filter/notities", :to => "notities#index" #voor de filter bij de notities maar werkt blijkbaar ook zonder deze lijn zie aankopen
    
    devise_for :users
  
    namespace :admin do
        root "base#index"
        resources :users
    end
end
