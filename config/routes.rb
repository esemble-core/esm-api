Rails.application.routes.draw do
  #resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :users

      resources :projects

      get :usersearch, :controller => 'users', :action => 'usersearch', :as => 'usersearch'

      get :status, :controller => 'status', :action => 'index'
    end
  end
end
