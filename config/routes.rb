Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :photoworkouts

      resources :privileges

      resources :teams

      resources :participations

      resources :challenges

      resources :users
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "challenges#index"
  resources :photoworkouts
  resources :privileges
  resources :teams
  resources :participations
  resources :challenges
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
