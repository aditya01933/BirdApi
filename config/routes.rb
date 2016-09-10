Rails.application.routes.draw do
  scope module: :api , defaults: {format: 'json'} do
    scope module: :v1, path: :v1 do
      resources :birds, except: :update
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
