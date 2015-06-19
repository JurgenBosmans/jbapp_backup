class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:inside]

  	def home
  	end
  
  	def inside
    	@website_aantal=current_user.websites.size
		@website=current_user.websites.reorder("id DESC").first
		@websites_pop=current_user.websites.reorder("count DESC").limit(4)
      
    	@notitie_aantal=current_user.notities.size
    	@notitie=current_user.notities.first
	  
	  	@aankoop_aantal=current_user.aankopen.size
	  	@aankoop=current_user.aankopen.first

		@meterstand_aantal=current_user.meterstanden.size
		@meterstand=current_user.meterstanden.first
		
		@onderhoud_aantal=current_user.onderhouden.size
		@onderhoud=current_user.onderhouden.first
		
		@leeg_aantal=0
		@leeg="?"
  	end 
end
