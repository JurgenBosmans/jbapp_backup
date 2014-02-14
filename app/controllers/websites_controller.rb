class WebsitesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_website, only: [:show, :edit, :update, :destroy]
  
  # GET /websites
  # GET /websites.json
  def index
    @websites = current_user.websites.search_and_order(params[:search], params[:page])
    #@aantal_websites = current_user.websites.all.size
    if params[:teller]
      @website = Website.find(params[:teller])
      @website.count += 1
      @website.laatste_bezoek = Time.now
      @website.save
      redirect_to params[:url]
    end  
    
  end

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
        format.html { redirect_to websites_path, notice: 'Website met succes aangemaakt.' }
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
        format.html { redirect_to websites_path, notice: 'Website met success geüpdate.' }
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
      format.html { redirect_to websites_url, notice: 'Website : ' + @website.sitenaam.upcase + ', met success verwijderd.' }
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
      params.require(:website).permit(:sitenaam, :url, :count, :user_id, :categorie)
    end
end
