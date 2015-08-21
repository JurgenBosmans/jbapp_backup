class AankopenController < ApplicationController
    before_filter :authenticate_user!
    before_action :set_aankoop, only: [:show, :edit, :update, :destroy]
    
    def index
		if params[:zoek]
				@aankopen = current_user.aankopen.where("aankoop LIKE ?", '%' + params[:zoek] + '%')
				@filter = "filter"
		else
			case params[:filter]
				when "euro"
					@aankopen = current_user.aankopen.where('prijs > 1000')     
					@filter = "aankoopbedrag > 1000 €"
				when "recent"
					@aankopen = current_user.aankopen.order("created_at DESC").limit(2)
					@filter = "recenste 2"
				when "alle"
        @aankopen = current_user.aankopen.all.reorder("aankoopdatum DESC")   
					@filter = "alle"
				when "maand"
					@aankopen = current_user.aankopen.where(aankoopdatum: (Time.now.midnight - 1.month)..Time.now)
					@filter = "afgelopen maand"
				when "jaar"
					@aankopen = current_user.aankopen.where(aankoopdatum: (Time.now.midnight - 1.year)..Time.now)    
					@filter = "afgelopen jaar"
				else
					@aankopen = current_user.aankopen.all.order("id DESC")   
					@filter = "alle"				
			end
		end
    end
    
    def show
    end

    def new
        @aankoop = Aankoop.new
    end

    def edit
    end

    def create  
		@aankoop = current_user.aankopen.new(aankoop_params)  
        respond_to do |format|
          if @aankoop.save
			  format.html { redirect_to aankopen_path, notice: 'Aankoop weggeschreven' }
            format.json { render action: 'show', status: :created, location: @aankoop }
          else
            format.html { render action: 'new' }
			  format.json { render json: @onderhoud.errors, status: :unprocessable_entity }
          end
        end
      end

  def update
    respond_to do |format|
        if @aankoop.update(aankoop_params)
			format.html { redirect_to aankopen_path, notice: 'Aankoop geüpdate' }
        	format.json { head :no_content }
      else
        format.html { render action: 'edit' }
            format.json { render json: @aankoop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @aankoop.destroy
    respond_to do |format|
		format.html { redirect_to aankopen_url, notice: 'Aankoop verwijderd' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aankoop
      @aankoop = Aankoop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aankoop_params
		params.require(:aankoop).permit(:artikel, :aankoopdatum, :user_id, :winkel, :prijs, :garantie_maanden, :soort, :opmerking)
    end   
end
