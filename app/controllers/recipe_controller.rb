class RecipeController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_index_path, notice: "#{@recipe.title.capitalize} wurde erstellt."
    else
      render "new"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to "/#{@recipe.id}"
    else
      render "new"
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def delete
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipe_index_path, notice: "#{recipe.title.capitalize} erfolgreich gelöscht."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :main_image)
  end
end
