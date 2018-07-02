Rails.application.routes.draw do
  resource :webhook_events, only: :create, defaults: { formats: :json }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :issues, only: :webhook_events do
    resources :webhook_events
  end

  post '/' => 'webhook_events#create'
end
