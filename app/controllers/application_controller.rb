class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_global_search_variable
  after_action :ahoy_tracking

  def set_global_search_variable
    @q = Recipe.search(params[:q])
  end

  def ahoy_tracking
    ahoy.track "User Visit"
  end
end
