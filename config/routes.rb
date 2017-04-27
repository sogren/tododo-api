require 'api_constraints'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :tasks
      get 'change_task_status/:id' => 'tasks#change_status'
    end
  end
end
