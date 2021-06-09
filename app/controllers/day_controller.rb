class DayController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @day = Day.all
    @title = "Wochenplan"
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
    @day = Day.friendly.find(params[:id])
  end

  def update
    @day = Day.friendly.find(params[:id])

    if @day.update(day_params)
      redirect_to day_index_path
    else
      render "new"
    end
  end

  def edit
    @day = Day.friendly.find(params[:id])
    redirect_to action: "edit", id: @day.friendly_id, status: 301 unless @day.friendly_id == params[:id]
    @title = "#{@day.name}"
  end

  def reset_plan
    Day.reset_plan
    redirect_to day_index_path
  end

  private

  def day_params
    params.require(:day).permit(:name, :recipe_id)
  end
end
