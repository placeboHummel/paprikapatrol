class HomeController < ApplicationController
  def index
    @recipe = Recipe.paginate(page: params[:page], per_page: 10).order("updated_at DESC")
  end
end
