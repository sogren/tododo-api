class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :change_status]

  def welcome

  end

  def index
    tasks = current_user.tasks
    render json: tasks
  end

  def show
    render json: @task
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
    @task = Task.find(params[:id])
  end
end
