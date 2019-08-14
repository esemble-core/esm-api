Rails.application.routes.draw do
  
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :projects

      resources :tasks, only: [:create, :show, :update]

      get :status, :controller => 'status', :action => 'index'
    
      get :usersearch, :controller => 'users'
      post :user_working_on_task, :controller => 'tasks'
      
      post :task_fundings, :controller => 'tasks', :action => 'create_task_funding'
      post :create_task_event, :controller => 'tasks', :action => 'create_task_event'
      post :create_event_verification, :controller => 'tasks', :action => 'create_event_verification'
      post :set_task_completed, :controller => 'tasks', :action => 'set_completed'

      get :task_event_types, :controller => 'tasks'
    end
  end
end
