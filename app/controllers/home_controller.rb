class HomeController < ApplicationController
  def index
    @recipe = Recipe.paginate(page: params[:page], per_page: 2)
  end
end
