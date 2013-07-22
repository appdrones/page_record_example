PageRecordExample::Application.routes.draw do
  resources :teams
  resources :games
  root 'teams#index'
end
