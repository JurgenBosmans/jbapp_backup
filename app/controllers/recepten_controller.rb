class ReceptenController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_recept, only: [:show, :edit, :update, :destroy]

    def index
		if params[:zoek]
			@recepten = current_user.recepten.where("naam ILIKE ?", '%' + params[:zoek] + '%')
			@filter = "filter"
		else
			case params[:filter]
				when "recent"
					@recepten = current_user.recepten.order("created_at DESC").limit(2)
					@filter = "recenste 2"
				when "alle"
					@recepten = current_user.recepten.all.order("id DESC")
					@filter = "alle"
				else
					@recepten = current_user.recepten.all.order("id DESC")
					@filter = "alle"
			end
		end
    end

	def ingredient
		@filter = 'Ingrediëntenlijst'
		@recepten = current_user.recepten.reorder("naam ASC")
	end

    def show
    end

    def new
		@recept = Recept.new
    end

    def edit
    end

    def create
		@recept = current_user.recepten.new(recept_params)
        respond_to do |format|
			if @recept.save
				format.html { redirect_to recepten_path, notice: 'Recept weggeschreven' }
				format.json { render action: 'show', status: :created, location: @recept }
          	else
            	format.html { render action: 'new' }
				format.json { render json: @recept.errors, status: :unprocessable_entity }
          	end
        end
	end

  	def update
    	respond_to do |format|
			if @recept.update(recept_params)
				format.html { redirect_to recepten_path, notice: 'Recept geüpdate' }
        		format.json { head :no_content }
      		else
        		format.html { render action: 'edit' }
				format.json { render json: @recept.errors, status: :unprocessable_entity }
      		end
    	end
  	end

  	def destroy
		@recept.destroy
    	respond_to do |format|
			format.html { redirect_to recepten_url, notice: 'Recept verwijderd' }
      		format.json { head :no_content }
    	end
  	end

  	private
    	# Use callbacks to share common setup or constraints between actions.
		def set_recept
			@recept = Recept.find(params[:id])
    	end

    	# Never trust parameters from the scary internet, only allow the white list through.
		def recept_params
			params.require(:recept).permit(:naam, :bron, :user_id, :soort, :bereidingstijd, :moeilijkheidsgraad, :personen, :werkwijze, :ingredient, ingredienten_attributes: [:id, :naam, :_destroy], werkwijzen_attributes: [:id, :stap, :_destroy])
    	end
end