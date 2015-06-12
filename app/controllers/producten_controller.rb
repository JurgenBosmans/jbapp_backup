class ProductenController < ApplicationController
    before_filter :authenticate_user!
	before_action :set_product, only: [:show, :edit, :update, :destroy]
    
    def index
		if params[:zoek]
			@producten = current_user.producten.where("naam LIKE ?", '%' + params[:zoek] + '%')
			@filter = "zie filter"
		else
			case params[:filter]
				when "recent"
					@producten = current_user.producten.order("created_at DESC").limit(5)
					@filter = "recenste 5"
				when "alle"
					@producten = current_user.producten.all.order("id DESC")   
					@filter = "alle"
				when "jaar"
					@producten = current_user.producten.where(created_at: (Time.now.midnight - 1.year)..Time.now)    
					@filter = "afgelopen jaar"
				else
					@producten = current_user.producten.all.order("id DESC")   
					@filter = "alle"				
			end
		end
    end
    
    def show
    end

    def new
		@product = Product.new
    end

    def edit
    end

    def create  
		@product = current_user.producten.new(product_params)  
        respond_to do |format|
			if @product.save
				format.html { redirect_to producten_path, notice: 'Product weggeschreven' }
				format.json { render action: 'show', status: :created, location: @product }
          else
            	format.html { render action: 'new' }
				format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
      end

  def update
    respond_to do |format|
		if @product.update(product_params)
			format.html { redirect_to producten_path, notice: 'Product geüpdate' }
        	format.json { head :no_content }
      else
        	format.html { render action: 'edit' }
			format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	  @product.destroy
    respond_to do |format|
		format.html { redirect_to producten_url, notice: 'Product verwijderd' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
	def set_product
		@product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def product_params
		params.require(:product).permit(:naam, :soort, :user_id, :score, :land, :winkel, :prijs, :eenheid, :opmerking, :seizoen)
    end   
end
