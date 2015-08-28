class PrestatiesController < ApplicationController
    before_filter :authenticate_user!
	before_action :set_prestatie, only: [:show, :edit, :update, :destroy]
    
    def index
			case params[:filter]
				when "maand"
					@prestaties = current_user.prestaties.where(datum: (Time.now.midnight - 1.month)..Time.now)
					@filter = "Afgelopen maand"
				when "jaar"
					@prestaties = current_user.prestaties.where(datum: (Time.now.midnight - 1.year)..Time.now)
					@filter = "Afgelopen jaar"
				when "school"
					@prestaties = current_user.prestaties.all
					@filter = "Schoolprestaties"
				when "sport"
					@prestaties = current_user.prestaties.all
					@filter = "Sportprestaties"
				else
					@prestaties = current_user.prestaties.all.order("id DESC")   
					@filter = "alle"				
			end
    end
    
    def show
    end

    def new
		@prestatie = Prestatie.new
    end

    def edit
    end

    def create  
		@prestatie = current_user.prestaties.new(prestatie_params)  
        respond_to do |format|
			if @prestatie.save
				format.html { redirect_to prestaties_path, notice: 'Prestatie weggeschreven' }
            format.json { render action: 'show', status: :created, location: @aankoop }
          else
            format.html { render action: 'new' }
				format.json { render json: @prestatie.errors, status: :unprocessable_entity }
          end
        end
      end

  def update
    respond_to do |format|
		if @prestatie.update(prestatie_params)
			format.html { redirect_to prestaties_path, notice: 'Prestatie geüpdate' }
        	format.json { head :no_content }
      else
        format.html { render action: 'edit' }
			format.json { render json: @prestatie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	  @prestatie.destroy
    respond_to do |format|
		format.html { redirect_to prestaties_url, notice: 'Prestatie verwijderd' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_prestatie
		@prestatie = Prestatie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def prestatie_params
		params.require(:prestatie).permit(:user_id, :datum, :persoon_id, :prestatie, :opmerking, :soort_prestatie_id, :resultaat, :tijd, :hr , :hr_avg, :cal, :best_lap, :avg_lap, :meettoestel, :gewicht, :afstand)
    end   
end
