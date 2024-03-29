class CategoriesController < ApplicationController
	before_filter :authenticate_user!
  	before_action :set_categorie, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = current_user.categories.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @categorie = Categorie.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
	  @categorie = current_user.categories.new(categorie_params)

    respond_to do |format|
      if @categorie.save
		  format.html { redirect_to categories_path, notice: 'Nieuwe categorie aangemaakt' }
        format.json { render action: 'show', status: :created, location: @categorie }
      else
        format.html { render action: 'new' }
        format.json { render json: @categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @categorie.update(categorie_params)
		  format.html { redirect_to categories_path, notice: 'Categorie geüpdate' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @categorie.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_categorie
    @categorie = Categorie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def categorie_params
    params.require(:categorie).permit(:omschrijving)
    end
end
