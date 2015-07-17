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
		@jaar = Time.now.year
		@jaar1 = @jaar - 1
		@jaar2 = @jaar - 2
		@jaar3 = @jaar - 3
		@jaar4 = @jaar - 4
    @waarde_jaar = current_user.meterstanden.where(datum: Time.new(@jaar1,11,1)..Time.new(@jaar,4,30)).sum("verbruik")
		@waarde_jaar1 = current_user.meterstanden.where(datum: Time.new(@jaar2,11,1)..Time.new(@jaar1,4,30)).sum("verbruik")
		@waarde_jaar2 = current_user.meterstanden.where(datum: Time.new(@jaar3,11,1)..Time.new(@jaar2,4,30)).sum("verbruik")
		@waarde_jaar3= current_user.meterstanden.where(datum: Time.new(@jaar4,11,1)..Time.new(@jaar3,4,30)).sum("verbruik")
		a = [@waarde_jaar , @waarde_jaar1 , @waarde_jaar2 , @waarde_jaar3]
		@max = a.max
		if @max == 0
			@grafiek_jaar = 0
			@grafiek_jaar1 = 0
			@grafiek_jaar2 = 0
			@grafiek_jaar3 = 0
		else
			@grafiek_jaar = @waarde_jaar * 100 / @max
			@procent_jaar = 100 - (@waarde_jaar1 * 100 / @waarde_jaar)
			@grafiek_jaar1 = @waarde_jaar1 * 100 / @max
			@procent_jaar1 = 100 - (@waarde_jaar2 * 100 / @waarde_jaar1)
			@grafiek_jaar2 = @waarde_jaar2 * 100 / @max
			@procent_jaar2 = 100 - (@waarde_jaar3 * 100 / @waarde_jaar2)
			@grafiek_jaar3 = @waarde_jaar3 * 100 / @max			
		end
		
		@waarde_tot_jaar = Meterstand.where(datum: Time.new(@jaar,1,1)..Time.new(@jaar,12,31)).sum("verbruik")
		@waarde_tot_jaar1 = Meterstand.where(datum: Time.new(@jaar1,1,1)..Time.new(@jaar1,12,31)).sum("verbruik")
		@waarde_tot_jaar2 = Meterstand.where(datum: Time.new(@jaar2,1,1)..Time.new(@jaar2,12,31)).sum("verbruik")
		@waarde_tot_jaar3 = Meterstand.where(datum: Time.new(@jaar3,1,1)..Time.new(@jaar3,12,31)).sum("verbruik")
	end
	
	def vergelijk
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
