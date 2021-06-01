class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :ahoy_tracking

  def ahoy_tracking
    ahoy.track "User Visit"
  end
end
