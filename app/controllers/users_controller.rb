class UsersController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @users = User.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
    @user = User.new
  end

  def create
    User.create(text: user_params[:text], log_id: current_log.id)
  end

  def destroy
    user = User.find(params[:id])
    if user.log_id == current_log.id
      user.destroy if user.log_id == current_log.id
  end
end

def edit
  @user = User.find(params[:id])
end

def update
  user = User.find(params[:id])
  if user.log_id == current_log.id
    user.update(user_params)
  end
end



  private
    def user_params
      # params.permit(:text)
      params.require(:user).permit(:text, :text)
    end
    
    def move_to_index
      redirect_to action: :index unless log_signed_in?
    end
end

