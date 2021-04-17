class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :gridview]

  def index
    @q = Recipe.ransack(params[:q])
    @recipe = @q.result(distinct: true).paginate(page: params[:page], per_page: 10).order("random()")
  end

  def gridview
    @q = Recipe.ransack(params[:q])
    @recipe = @q.result(distinct: true).paginate(page: params[:page], per_page: 10).order("random()")
  end
end

