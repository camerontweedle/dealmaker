# frozen_string_literal: true

Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :templates do
    resources :documents
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'templates#index'
end
