Admin::Engine.routes.draw do
  resources :languages
  resources :users
  resources :services
  resources :shards do
    resources :shard_users
    resources :shard_languages
  end
  root to: "services#index"
end
