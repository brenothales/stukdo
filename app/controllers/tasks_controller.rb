class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :change]

  respond_to :html


  # GET /tasks 
  # GET /tasks.json
  def index
    @to_do = current_user.tasks.where(state: "to_do")
    @doing = current_user.tasks.where(state: "doing")
    @done = current_user.tasks.where(state: "done")
    @tasknew = Task.new
    # @task = Task.includes(subtasks: :logs).first

    @tasks = Task.all
    @task = Task.includes(subtasks: :logs).first


     respond_with(@tasks)
  end 

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.new(task_params) 
    @tasks = Task.all
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
        format.js
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def change
    @task.update_attributes(state: params[:state])
      respond_to do |format|
      format.html {redirect_to tasks_path} #notice: "Tarefa atualizda com sucesso"
    end
    @task.subtasks.each do |stk|
      if stk.work?
        stk.logs.first.update(stop: Time.now)
      end
    end
  end

   def sort
     params[:order].each do |key,value|
       Task.find(value[:id]).update_attribute(:priority,value[:position])
     end
     render :nothing => true
   end


  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:content, :state, :descricao, :url, :public)
    end
end
