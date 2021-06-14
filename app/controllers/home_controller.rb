class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    Recipe.reorder_in_progress
    @q = Recipe.ransack(params[:q])
    @recipe = @q.result(distinct: true).paginate(page: params[:page], per_page: 10).order("updated_at DESC")
  end
end
