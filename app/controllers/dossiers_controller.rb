class DossiersController < ApplicationController
  	before_filter :authenticate_user!
	before_action :set_dossier, only: [:show, :edit, :update, :destroy]
    
    def index
		if params[:search]
			@dossiers = current_user.dossiers.where("afgehandeld LIKE ?", '%' + params[:search] + '%')
			@filter = "filter"
		else
			case params[:filter]
				when "maand"
					@dossiers = current_user.dossiers.where(datum_onderzoek: (Time.now.midnight - 1.month)..Time.now).order("created_at DESC")
					@filter = "dossiers van de afgelopen maand"
				when "niet"
					@dossiers = current_user.dossiers.where("afgehandeld LIKE 'Nee'").order("created_at DESC")
					@filter = "niet afgewerkte dossiers"
				when "niet_mutualiteit"
					@dossiers = current_user.dossiers.where("ziekenkas_verzonden LIKE 'Nee'").order("created_at DESC")
					@filter = "niet verzonden naar de mutualiteit"
				when "niet_verzekering"
					@dossiers = current_user.dossiers.where("afgehandeld LIKE 'Nee'").order("created_at DESC")
					@filter = "niet verzonden naar de verzekering"
				else
					@dossiers = current_user.dossiers.all.order("id DESC")   
					@filter = "alle"				
			end
		end
    end
    
    def show
    end

    def new
		@dossier= Dossier.new
    end

    def edit
    end

    def create  
		@dossier = current_user.dossiers.new(dossier_params)  
        respond_to do |format|
			if @dossier.save
				format.html { redirect_to dossiers_path, notice: 'Dossier weggeschreven' }
				format.json { render action: 'show', status: :created, location: @dossier }
          else
				format.html { render action: 'new' }
				format.json { render json: @dossier.errors, status: :unprocessable_entity }
          end
        end
      end

  def update
    respond_to do |format|
		if @dossier.update(dossier_params)
			format.html { redirect_to dossiers_path, notice: 'Dossier geüpdate' }
        	format.json { head :no_content }
      else
        format.html { render action: 'edit' }
			format.json { render json: @dossier.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	  @dossier.destroy
    respond_to do |format|
		format.html { redirect_to dossiers_url, notice: 'Dossier verwijderd' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_dossier
		@dossier = Dossier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def dossier_params
		params.require(:dossier).permit(:persoon_id, :arts_id, :user_id, :instelling, :soort_opname, :datum_onderzoek, :datum_document, :soort_document, :eigen_referentie, :te_betalen, :betaald, :ziekenkas_verzonden, :ziekenkas_terug_bedrag, :verzekering_verzonden, :verzekering_terug_bedrag, :beschrijving, :afgehandeld, :resultaat, :medicatie)
    end   
end
