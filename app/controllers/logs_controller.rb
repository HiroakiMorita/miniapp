class UsersController < ApplicationController
  def show
    @users = User.where(log_id: current_log.id).page(params[:page]).per(5).order("created_at DESC")
  end
end