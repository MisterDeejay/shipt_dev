Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :customers, only: [] do
      resources :orders, only: [ :index ]
    end

    resources :items, only: [ :index ]
  end
end
