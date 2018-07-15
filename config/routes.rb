Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :winelists, only: [:index, :create, :destroy, :show, :update]
      resources :wines, only: [:index, :show, :create, :destroy, :update]
      resources :winelist_wines, only: [:index, :create, :destroy]
    end
  end
end
