Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    # resources :users do 
      resources :trips do
        resources :pois do
        end
      end
    end
  # end
end