class DayController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @day = Day.all
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)

    if @day.save
      redirect_to day_index_path
    else
      render "new"
    end
  end

  def show
    @day = Day.find(params[:id])
  end

  def update
    @day = Day.find(params[:id])

    if @day.update(day_params)
      redirect_to day_index_path
    else
      render "new"
    end
  end

  def edit
    @day = Day.find(params[:id])
  end

  private

  def day_params
    params.require(:day).permit(:name, :recipe_id)
  end
end
