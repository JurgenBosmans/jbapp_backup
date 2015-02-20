class NotitiesController < ApplicationController
    before_filter :authenticate_user!
    
    def index
        case
            when params[:belangrijk]
                @notities = current_user.notities.where('belangrijk = ?', true) 
            when params[:belangrijk2]
                @notities = current_user.notities.where('belangrijk = ?', 1) 
            when params[:belangrijk3]
                @notities = current_user.notities.where('belangrijk = ?', -1)             
            when params[:recent]
                @notities = current_user.notities.order("created_at DESC").limit(6)
            else
                @notities = current_user.notities.all    
        end
    end
end