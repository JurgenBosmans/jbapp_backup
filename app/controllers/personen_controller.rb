class PersonenController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_persoon, only: [:show, :edit, :update, :destroy]

  def index
	  case params[:filter]
		  when "kind"
			@personen = current_user.personen.where("soort LIKE 'Kind'")
			@filter = "filter"
		else
	  		@personen = current_user.personen.all
		end
  end

  def show
  end

  def new
	  @persoon = Persoon.new
  end

  def edit
  end

  def create
	  @persoon = current_user.personen.new(persoon_params)

    respond_to do |format|
		if @persoon.save
			format.html { redirect_to personen_path, notice: 'Nieuwe persoon aangemaakt' }
			format.json { render action: 'show', status: :created, location: @persoon }
      else
        	format.html { render action: 'new' }
			format.json { render json: @persoon.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
		if @persoon.update(persoon_params)
			format.html { redirect_to personen_path, notice: 'Persoon geüpdate' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
			format.json { render json: @persoon.errors, status: :unprocessable_entity }
      end
    end
  end

	
  def destroy
	  @persoon.destroy
    respond_to do |format|
		format.html { redirect_to personen_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_persoon
		@persoon = Persoon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def persoon_params
		params.require(:persoon).permit(:naam, :voornaam, :soort, :geboortedatum)
    end
end
