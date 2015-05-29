class TipsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_tip, only: [:show, :edit, :update, :destroy]

  def index
	  @tips = current_user.tips.all
  end

  def show
  end

  def new
	  @tip = Tip.new
  end

  def edit
  end

  def create
	  @tip = current_user.tips.new(tip_params)

    respond_to do |format|
		if @tip.save
			format.html { redirect_to tips_path, notice: 'Nieuwe culinaire tip aangemaakt' }
			format.json { render action: 'show', status: :created, location: @tip }
      else
        format.html { render action: 'new' }
			format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
		if @tip.update(tip_params)
			format.html { redirect_to tips_path, notice: 'Tip geüpdate' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
			format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

	
  def destroy
	  @tip.destroy
    respond_to do |format|
		format.html { redirect_to tips_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_tip
		@tip = Tip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def tip_params
		params.require(:tip).permit(:tip)
    end
end
