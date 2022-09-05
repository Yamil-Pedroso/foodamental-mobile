class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all

    @markers = @recipes.geocoded.map do |recipe|
      {
        lat: recipe.latitude,
        lng: recipe.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { recipe: recipe }),
        image_url: helpers.asset_url('logo.png')
      }
    end
  end

  def show

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description, :pic_url, :longitude, :latitude, :user_id)
    end

end
