class HomeController < ApplicationController
  def index
  end
  def profile
    @user = User.find_by_id(params[:id])
  end
  def users
    @users = User.all
  end
end
