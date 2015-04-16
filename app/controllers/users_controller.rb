class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only:[:show]
  
  def index
    @users = User.includes(:tasks)#.includes(tasks: :sub_tasks).all
    @users = User.all
  end

  def show
    
  end
 

private
  def set_user
      @user = User.find_by(id: params[:id]) 
  end
end
