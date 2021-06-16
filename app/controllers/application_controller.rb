class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_global_search_variable
  skip_before_action :authenticate_user!, only: [:moon, :sun]
  after_action :ahoy_tracking

  def set_global_search_variable
    @q = Recipe.search(params[:q])
  end

  def ahoy_tracking
    ahoy.track "User Visit"
  end

  def moon
    cookies[:moon] = {
      value: "dark mode on",
    }
    redirect_to root_path
  end

  def sun
    cookies.delete(:moon)
    redirect_to root_path
  end
end
