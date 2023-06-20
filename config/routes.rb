Rails.application.routes.draw do
  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :games, only: [:create, :update]
      end
    end
  end
end
