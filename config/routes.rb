Dns::Application.routes.draw do
  resources :domains do
    resources :records
  end

  root to: 'domains#index'
end
