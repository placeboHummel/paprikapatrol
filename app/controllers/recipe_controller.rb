class RecipeController < ApplicationController
  def index
    @q = Recipe.ransack(params[:q])
    @recipe = @q.result(distinct: true).paginate(page: params[:page], per_page: 15).order("updated_at DESC")
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to "/#{@recipe.id}", notice: "#{@recipe.title.titleize} wurde erstellt."
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
    redirect_to recipe_index_path, notice: "#{recipe.title.titleize} erfolgreich gelöscht."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :main_image)
  end
end
