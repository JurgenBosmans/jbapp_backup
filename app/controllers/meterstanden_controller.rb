class MeterstandenController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_meterstand, only: [:show, :edit, :update, :destroy]
  
  def index
	  case params[:filter]
	  	when "alle"
		  @meterstanden = current_user.meterstanden.all.order("id DESC")  
		  	@filter="Alle"
	  	when "recent"
		  	@meterstanden = current_user.meterstanden.order("created_at DESC").limit(1)
		  	@filter="Recentste"
	  end
  end

  def show
  end

	
	def winter
		
	end
	
  def new
	  @meterstand = Meterstand.new
	  @meterstand_vorig = current_user.meterstanden.first # let op met default order
  end

  def edit
  end

  def create  
	  @meterstand = current_user.meterstanden.new(meterstand_params)
    
    respond_to do |format|
		if @meterstand.save
			format.html { redirect_to meterstanden_path(:filter => "alle"), notice: 'Meterstand aangemaakt' }
			format.json { render action: 'show', status: :created, location: @meterstand }
      else
        format.html { render action: 'new' }
			format.json { render json: @meterstand.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
		if @meterstand.update(meterstand_params)
			format.html { redirect_to meterstanden_path(:filter => "alle"), notice: 'Meterstand geüpdate' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
			format.json { render json: @meterstand.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	  @meterstand.destroy
    respond_to do |format|
		format.html { redirect_to meterstanden_url(:filter => "alle"), notice: 'Meterstand ' + @meterstand.datum.try(:strftime, "%d/%m/%Y") + ', werd verwijderd' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_meterstand
		@meterstand = Meterstand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def meterstand_params
		params.require(:meterstand).permit(:meter, :datum, :stand, :user_id, :verbruik)
    end
end
