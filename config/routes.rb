Rails.application.routes.draw do
  
  namespace 'api' do
    namespace 'v1' do
      resources :users

      resources :projects

      resources :tasks, only: [:create, :show]

      get :usersearch, :controller => 'users'

      get :status, :controller => 'status', :action => 'index'
    
      post :user_working_on_task, :controller => 'tasks'
      post :task_fundings, :controller => 'tasks', :action => 'create_task_funding'

    end
  end
end
