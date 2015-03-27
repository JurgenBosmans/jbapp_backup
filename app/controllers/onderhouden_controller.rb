class OnderhoudenController < ApplicationController
   	before_filter :authenticate_user!
	before_action :set_onderhoud, only: [:show, :edit, :update, :destroy]
    
    def index
		if params[:zoek]
				@aankopen = current_user.aankopen.where("aankoop LIKE ?", '%' + params[:zoek] + '%')
				@filter = "filter"
		else
			case params[:filter]
				when "recent"
					@onderhouden = current_user.onderhouden.all.order("created_at DESC").limit(2)
					@filter = "recenste 2"
				else
					@onderhouden = current_user.onderhouden.all.order("id DESC")   
					@filter = "alle"				
			end
		end
    end
    
    def show
    end

    def new
		@onderhoud = Onderhoud.new
    end

    def edit
    end

    def create  
		@onderhoud = current_user.onderhouden.new(onderhoud_params)  
        respond_to do |format|
			if @onderhoud.save
				format.html { redirect_to onderhouden_path, notice: 'Onderhoud weggeschreven' }
				format.json { render action: 'show', status: :created, location: @onderhoud }
          else
            format.html { render action: 'new' }
				format.json { render json: @onderhoud.errors, status: :unprocessable_entity }
          end
        end
      end

  def update
    respond_to do |format|
		if @onderhoud.update(onderhoud_params)
			format.html { redirect_to onderhouden_path, notice: 'Onderhoud geüpdate' }
        	format.json { head :no_content }
      else
        format.html { render action: 'edit' }
			format.json { render json: @onderhoud.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	  @onderhoud.destroy
    respond_to do |format|
		format.html { redirect_to onderhouden_url, notice: 'Onderhoud verwijderd' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_onderhoud
		@onderhoud = Onderhoud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def onderhoud_params
		params.require(:onderhoud).permit(:aankoop_id, :user_id, :datum_onderhoud, :volgende_onderhoud, :opmerking, :prijs, :teller, :teller_eh)
    end   
end
