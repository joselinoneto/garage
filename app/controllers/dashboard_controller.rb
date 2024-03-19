class DashboardController < ApplicationController
  layout "dashboard"
  before_action :authorize_user
  
  def index
  end
end
