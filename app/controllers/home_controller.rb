class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @q = Recipe.ransack(params[:q])
    @recipe = @q.result(distinct: true).paginate(page: params[:page], per_page: 10).order("updated_at DESC")
  end

  def reorder
    Recipe.reorder_in_progress
    redirect_to admin_path
  end
end
