class SoortPrestatiesController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_soort_prestatie, only: [:show, :edit, :update, :destroy]

  def index
	  @soort_prestatie = current_user.soort_prestaties.all
  end

  def new
	  @soort_prestatie = SoortPrestatie.new
  end

  def create
	  @soort_prestatie = current_user.soort_prestaties.new(soort_prestatie_params)

    respond_to do |format|
		if @soort_prestatie.save
			format.html { redirect_to soort_prestaties_path, notice: 'Soort prestatie aangemaakt' }
			format.json { render action: 'show', status: :created, location: @soort_prestatie }
      else
        	format.html { render action: 'new' }
			format.json { render json: @soort_prestatie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
		if @soort_prestatie.update(soort_prestatie_params)
			format.html { redirect_to soort_prestaties_path, notice: 'Soort prestatie geüpdate' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
			format.json { render json: @soort_prestatie.errors, status: :unprocessable_entity }
      end
    end
  end

	
  def destroy
	  @soort_prestatie.destroy
    respond_to do |format|
		format.html { redirect_to soort_prestaties_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_soort_prestatie
		@soort_prestatie = SoortPrestatie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def soort_prestatie_params
		params.require(:soort_prestatie).permit(:soort, :soort_detail)
    end
end
