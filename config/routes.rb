Rails.application.routes.draw do

  resources :users, path: '/api/users', defaults: {format: :json}   do 
    resources :trips do
      resources :pois do
      end
    end
  end
end