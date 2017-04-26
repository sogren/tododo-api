class Api::TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :change_status]

  def index
    tasks = current_user.tasks
    render json: tasks
  end

  def show
    render json: @task
  end

  def create
    current_user
    if current_user.tasks.create(task_params)
      render json: true
    else
      render json: false
    end
  end

  def change_status
    if @task.done? && @task.new_task! || @task.new_task? && @task.done!
      render json: true
    else
      render json: false
    end
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content)
  end
end
