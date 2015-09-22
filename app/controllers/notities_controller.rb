class NotitiesController < ApplicationController
    before_filter :authenticate_user!
    before_action :set_notitie, only: [:show, :edit, :update, :destroy]
    
    def index
		if params[:zoek]
				@notities = current_user.notities.where("notitie ILIKE ?", '%' + params[:zoek] + '%')
				@filter = "filter"
		else
			case params[:filter]
				when "belangrijk"
					@notities = current_user.notities.where('belangrijk = ?', true)     
					@filter = "belangrijk"
				when "recent"
					@notities = current_user.notities.order("created_at DESC").limit(4)
					@filter = "recenste 4"
				when "alle"
					@notities = current_user.notities.all.order("id DESC")   
					@filter = "alle"
				when "week"
					@notities = current_user.notities.where(created_at: (Time.now.midnight - 7.day)..Time.now)
					@filter = "afgelopen week"
				else
					@notities = current_user.notities.where(created_at: (Time.now.midnight - 7.day)..Time.now)    
					@filter = "afgelopen week"
			end
		end
    end
    
    def show
		
		
    end

    def new
        @notitie = Notitie.new
    end

    def edit
    end

    def create  
        @notitie = current_user.notities.new(notitie_params)  
        respond_to do |format|
          if @notitie.save
              format.html { redirect_to notities_path, notice: 'Notitie weggeschreven' }
            format.json { render action: 'show', status: :created, location: @notitie }
          else
            format.html { render action: 'new' }
            format.json { render json: @notitie.errors, status: :unprocessable_entity }
          end
        end
      end

  def update
    respond_to do |format|
        if @notitie.update(notitie_params)
            format.html { redirect_to notities_path, notice: 'Notitie geüpdate' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
            format.json { render json: @notitie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notitie.destroy
    respond_to do |format|
        format.html { redirect_to notities_path(:filter => "alle"), notice: 'Notitie verwijderd' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notitie
      @notitie = Notitie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notitie_params
        params.require(:notitie).permit(:notitie, :belangrijk, :user_id)
    end   
end