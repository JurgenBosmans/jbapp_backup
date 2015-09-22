class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:inside]

  	def home
  	end
  
    def about
    end
  
  	def inside
		if  Website.exists? then
			@website=current_user.websites.reorder("id DESC").first
    		@website_aantal=current_user.websites.size
			@websites_pop=current_user.websites.reorder("count DESC").limit(4)
		end
			
    	@notitie_aantal=current_user.notities.size
      	@notitie=current_user.notities.reorder("id DESC").first
	  
	  	@aankoop_aantal=current_user.aankopen.size
	  	@aankoop=current_user.aankopen.first

		@meterstand_aantal=current_user.meterstanden.size
		@meterstand=current_user.meterstanden.first
		
		@onderhoud_aantal=current_user.onderhouden.size
		@onderhoud=current_user.onderhouden.first
		
		@dossier_aantal=current_user.dossiers.size
		@dossier=current_user.dossiers.first

		@recept_aantal=current_user.recepten.size
		@recept=current_user.recepten.first
		
		@prestatie_aantal=current_user.prestaties.size
		@prestatie=current_user.prestaties.first
			
		@todo_aantal=current_user.todos.size
		@todo=current_user.todos.first		
			
		@leeg_aantal=0
		@leeg="?"
  	end 
end
