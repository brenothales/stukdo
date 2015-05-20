class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only:[:show]

respond_to :json

  def index
    @users = User.includes(:tasks).includes(tasks: :subtasks).all
    @tasks = Task.all
  end

  def show

    @user = User.with_public_tasks.where(id: params[:id]).last

    @to_do = @user.tasks.public_tasks.where(state: "to_do")
    @doing = @user.tasks.public_tasks.where(state: "doing")
    @done = @user.tasks.public_tasks.where(state: "done")


    redirect_to users_path, notice: "Desculpe, este usuário não tem funções públicas" unless @user.present?
  end
 

private
  def set_user
      @user = User.find_by(id: params[:id]) 
  end
end
