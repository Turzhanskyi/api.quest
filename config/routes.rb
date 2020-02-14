# frozen_string_literal: true

Rails.application.routes.draw do
  resources :quests, only: %i[create]
end
