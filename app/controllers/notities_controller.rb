class NotitiesController < ApplicationController
    before_filter :authenticate_user!
    
    def index
        @notities = current_user.notities.all
    end
end
