Dns::Application.routes.draw do
  resources :domains do
    resources :records, except: [ :index, :show ]
  end

  root to: 'domains#index'
end
