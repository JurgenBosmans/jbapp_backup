class ArtsenController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_arts, only: [:show, :edit, :update, :destroy]

  def index
	  @artsen = current_user.artsen.all
  end

  def show
  end

  def new
	  @arts = Arts.new
  end

  def edit
  end

  def create
	  @arts = current_user.artsen.new(arts_params)

    respond_to do |format|
		if @arts.save
			format.html { redirect_to artsen_path, notice: 'Nieuwe arts aangemaakt' }
			format.json { render action: 'show', status: :created, location: @arts }
      else
        format.html { render action: 'new' }
			format.json { render json: @arts.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
		if @arts.update(arts_params)
			format.html { redirect_to artsen_path, notice: 'Arts geüpdate' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
			format.json { render json: @arts.errors, status: :unprocessable_entity }
      end
    end
  end

	
  def destroy
	  @arts.destroy
    respond_to do |format|
		format.html { redirect_to artsen_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_arts
		@arts = Arts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def arts_params
		params.require(:arts).permit(:naam, :telefoon, :website, :beschrijving, :specialiteit)
    end
end