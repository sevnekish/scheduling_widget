Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cpt_codes, only: %i[index]
      resources :offices, only: %i[index]
    end
  end
end
