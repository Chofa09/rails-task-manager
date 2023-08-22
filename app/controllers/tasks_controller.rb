class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    if @task.completed == true
      @message = 'This task is completed'
    else
      @message = 'This task is not completed yet'
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit

  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
