Dns::Application.routes.draw do
  resources :domains, execept: [ :edit, :update ] do
    resources :records, only: [ :new, :create, :destroy, :edit, :update ]
  end

  root to: 'domains#index'
end
