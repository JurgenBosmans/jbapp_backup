class WebsitesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_website, only: [:show, :edit, :update, :destroy]
  
  # GET /websites
  # GET /websites.json
	    def index
			if params[:zoek]
				@websites = current_user.websites.where("sitenaam ILIKE ?", '%' + params[:zoek] + '%')
				@filter = "filter"
			elsif params[:teller]
				@website = Website.find(params[:teller])
				@website.count += 1
				@website.laatste_bezoek = Time.now
				@website.save
				redirect_to params[:url]  
			else
				case params[:filter]
					when "top"
						@websites = current_user.websites.reorder("count DESC").limit(10)     
						@filter = "Top sites"
					when "recent"
						@websites = current_user.websites.reorder("laatste_bezoek DESC").limit(5)
						@filter = "Recent bezocht"
					when "toegevoegd"
						@websites = current_user.websites.reorder("created_at DESC").limit(5)
						@filter = "Recent toegevoegd"
					when "alle"
						@websites = current_user.websites.all
						@filter = "Alle"
					when "maand"
						@websites = current_user.websites.where(created_at: (Time.now.midnight - 31.day)..Time.now)
						@filter = "Afgelopen maand"
					when "categorie"
						@websites = current_user.websites.reorder("categorie_id ASC")
						@filter = "Alle met sortering op categorie"			
					when "laatste_bezoek_sorteer"
						@websites = current_user.websites.reorder("laatste_bezoek DESC")
						@filter = "Alle met sortering op laatste bezoek"							
					else
						@websites = current_user.websites.all
						@filter = "Alle"
				end
			end
    	end
#   def index
# 	  @filter="Alle"
#     if params[:top]
#       @websites = current_user.websites.order("count DESC").search_and_order(params[:search], params[:page]).per(10)
#     elsif params[:recent_bezocht]
#       @websites = current_user.websites.order("laatste_bezoek DESC").search_and_order(params[:search], params[:page]).per(5)
#     elsif params[:recentste]
#       @websites = current_user.websites.order("created_at DESC").search_and_order(params[:search], params[:page]).per(5)
#     elsif params[:teller]
#         @website = Website.find(params[:teller])
#         @website.count += 1
#         @website.laatste_bezoek = Time.now
#         @website.save
#         redirect_to params[:url]  
#     elsif 
#         @websites = current_user.websites.search_and_order(params[:search], params[:page])
#     end  
#   end

  # GET /websites/1
  # GET /websites/1.json
  def show
  end

  # GET /websites/new
  def new
    @website = Website.new
  end

  # GET /websites/1/edit
  def edit
  end

  # POST /websites
  # POST /websites.json
  def create  
    @website = current_user.websites.new(website_params)
    @website.count = 1 # omdat de default moet 0 zijn
    @website.laatste_bezoek = Time.now # omdat de default moet 0 zijn
    
    respond_to do |format|
      if @website.save
        format.html { redirect_to websites_path, notice: 'Website aangemaakt' }
        format.json { render action: 'show', status: :created, location: @website }
      else
        format.html { render action: 'new' }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /websites/1
  # PATCH/PUT /websites/1.json
  def update
    respond_to do |format|
      if @website.update(website_params)
        format.html { redirect_to websites_path, notice: 'Website geüpdate' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.json
  def destroy
    @website.destroy
    respond_to do |format|
		format.html { redirect_to websites_url, notice: 'Website ' + @website.sitenaam.upcase + ', werd verwijderd' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website
      @website = Website.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def website_params
		params.require(:website).permit(:sitenaam, :url, :count, :user_id, :categorie_id, :laatste_bezoek)
    end
end
