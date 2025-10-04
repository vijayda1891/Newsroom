class DashboardController < ApplicationController

  before_action :authenticate_user!, only: [:user_dashboard]

  def index
  end

  def user_dashboard
  end
end
