class DayController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @day = Day.all
    @momittag = Day.find_by(name: "Montag Mittag")
    @moabend = Day.find_by(name: "Montag Abend")
    @dimittag = Day.find_by(name: "Dienstag Mittag")
    @diabend = Day.find_by(name: "Dienstag Abend")
    @mimittag = Day.find_by(name: "Mittwoch Mittag")
    @miabend = Day.find_by(name: "Mittwoch Abend")
    @domittag = Day.find_by(name: "Donnerstag Mittag")
    @doabend = Day.find_by(name: "Donnerstag Abend")
    @frmittag = Day.find_by(name: "Freitag Mittag")
    @frabend = Day.find_by(name: "Freitag Abend")
    @samittag = Day.find_by(name: "Samstag Mittag")
    @saabend = Day.find_by(name: "Samstag Abend")
    @somittag = Day.find_by(name: "Sonntag Mittag")
    @soabend = Day.find_by(name: "Sonntag Abend")
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
