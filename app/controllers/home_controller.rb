class HomeController < ApplicationController
  def index
    @recipe = Recipe.paginate(page: params[:page], per_page: 10)
  end
end
