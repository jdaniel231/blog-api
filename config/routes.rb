Rails.application.routes.draw do
  devise_for :users, 
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  
  namespace :api do
    namespace :v1 do
      resources :posts do
        collection do
          get :my_blog_posts
        end
      end
    end
  end
end