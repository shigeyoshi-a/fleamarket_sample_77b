Rails.application.routes.draw do
  get 'users/show'
  devise_for :users ,controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:new, :create, :edit, :update, :show] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :users, only: [:show]

end
