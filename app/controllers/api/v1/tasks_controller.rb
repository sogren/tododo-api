module Api
  module V1
    class TasksController < ApplicationController
      before_action :authenticate_user!
      before_action :set_task, only: %i[show change_status destroy update]

      def index
        tasks = current_user.tasks
        render json: tasks
      end

      def show
        render json: @task
      end

      def create
        if current_user.tasks.create(task_params)
          render json: true
        else
          render json: false
        end
      end

      def update
        if @task && @task.update(task_params)
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

      def destroy
        if @task.destroy
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
  end
end
