class BereidingenController < ApplicationController
   	before_filter :authenticate_user!
	before_action :set_bereiding, only: [:show, :edit, :update, :destroy]
    
    def index
      if params[:recept_id]
        @recept = Recept.find(params[:recept_id])
        @bereidingen = current_user.bereidingen.where("recept_id LIKE ?", @recept)  
      else
        case params[:filter]
	    		when "alle"
            @bereidingen = current_user.bereidingen.all.order("created_at DESC")
				    @filter = "alle"
			    else
            @bereidingen = current_user.bereidingen.all.order("created_at DESC")
				    @filter = "alle"			
		    end
      end
	  end

    
    def show
    end

    def new
		@bereiding = Bereiding.new
    end

    def edit
    end

    def create  
		@bereiding = current_user.bereidingen.new(bereiding_params)  
        respond_to do |format|
			if @bereiding.save
				format.html { redirect_to bereidingen_path, notice: 'Bereiding weggeschreven' }
				format.json { render action: 'show', status: :created, location: @bereiding }
          else
            	format.html { render action: 'new' }
				format.json { render json: @bereiding.errors, status: :unprocessable_entity }
          end
        end
      end

  def update
    respond_to do |format|
		if @bereiding.update(bereiding_params)
			format.html { redirect_to bereidingen_path, notice: 'Bereiding geüpdate' }
        	format.json { head :no_content }
      else
        	format.html { render action: 'edit' }
			format.json { render json: @bereiding.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	  	@bereiding.destroy
    	respond_to do |format|
			format.html { redirect_to bereidingen_url, notice: 'Bereiding verwijderd' }
      		format.json { head :no_content }
    	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_bereiding
		@bereiding = Bereiding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def bereiding_params
		params.require(:bereiding).permit(:recept_id, :user_id, :datum, :score, :opmerking)
    end   
end
