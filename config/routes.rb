Rails.application.routes.draw do
  #resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :users

      resources :projects

      resources :tasks

      get :usersearch, :controller => 'users'#, :action => 'usersearch'

      #post :tasks, :controller => 'projects', :action => 'create_task'

      get :status, :controller => 'status', :action => 'index'
    
      post :user_working_on_task, :controller => 'tasks'#, :action => 'user_working_on_task'
    end
  end
end
