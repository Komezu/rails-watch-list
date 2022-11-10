Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists, only: %i[index show new create] do
    # resources :bookmarks, only: %i[new create]
    resources :bookmarks, only: :create
  end

  resources :bookmarks, only: :destroy
end
