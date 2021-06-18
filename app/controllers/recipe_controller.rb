class RecipeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  skip_before_action :verify_authenticity_token

  def index
    @q = Recipe.ransack(params[:q])
    @recipe = @q.result(distinct: true).order("title ASC")
    @title = "Alle Rezepte"
  end

  def new
    @recipe = Recipe.new
    @title = "Neues Rezept"
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      respond_to do |format|
        format.html { redirect_to("/#{@recipe.id}") }
        format.json { render :json => { id: @recipe.id, title: @recipe.title } }
      end
    else
      render "new"
    end
  end

  def show
    @recipe = Recipe.friendly.find(params[:id])
    redirect_to action: "show", id: @recipe.friendly_id, status: 301 unless @recipe.friendly_id == params[:id]
    @title = "#{@recipe.title}"
  end

  def update
    @recipe = Recipe.friendly.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to "/#{@recipe.id}"
    else
      render "new"
    end
  end

  def edit
    @recipe = Recipe.friendly.find(params[:id])
    redirect_to action: "edit", id: @recipe.friendly_id, status: 301 unless @recipe.friendly_id == params[:id]
    @title = "#{@recipe.title}"
  end

  def delete
    recipe = Recipe.friendly.find(params[:id])
    recipe.destroy
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :main_image)
  end
end
