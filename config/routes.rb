Rails.application.routes.draw do
  #resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :users

      get :usersearch, :controller => 'users', :action => 'usersearch', :as => 'usersearch'
    end
  end
end
