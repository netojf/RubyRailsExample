Rails.application.routes.draw do

  resources :libraries
  resources :articles, only: [:list, :new, :show, :delete, :create]
  resources :autors, only: [:index, :new, :delete, :create, :show]

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'delete', to: 'autors#delete', as: 'autor_delete'
  post 'delete', to: 'articles#delete', as: 'article_delete'
  get 'articles', to: 'articles#list', as: 'articles_list'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
end
