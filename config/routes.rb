Admin::Engine.routes.draw do
  resources :languages
  resources :users
  resources :services
  resources :shards do
    resources :shard_users
    resources :shard_languages
  end
  root to: "services#index"

  devise_for :users,
    path_names: { sign_in: "login", sign_out: "logout", sign_up: "signup" },
    sign_out_via: [:post, :delete, :get],
    controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }
end
