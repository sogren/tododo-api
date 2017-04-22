class TasksController < ApplicationController
  def welcome

  end

  def index
    tasks = [ { id: 11, content: 'aernoan erga3ao iy5s', title: 'Mr. Nice' },
              { id: 12, content: 'aernoan erga3ao iy5s', title: 'Narco' },
              { id: 13, content: 'aernoan erga3ao iy5s', title: 'Bombasto' },
              { id: 14, content: 'aernoan erga3ao iy5s', title: 'Celeritas' },
              { id: 15, content: 'aernoan erga3ao iy5s', title: 'Magneta' },
              { id: 16, content: 'aernoan erga3ao iy5s', title: 'RubberMan' },
              { id: 17, content: 'aernoan erga3ao iy5s', title: 'Dynama' },
              { id: 18, content: 'aernoan erga3ao iy5s', title: 'Dr IQ' },
              { id: 19, content: 'aernoan erga3ao iy5s', title: 'Magma' },
              { id: 20, content: 'aernoan erga3ao iy5s', title: 'Tornado' }
            ]
    render json: tasks
  end

  def show
    task = { id: 11, content: 'aernoan erga3ao iy5s', title: 'Mr. Nice' }
    render json: task
  end
end
