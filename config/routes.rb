Rails.application.routes.draw do
  get 'refresh/create'
  get 'login/create'
  root to: proc { [404, {}, ["Not found."]] }
  jsonapi_resources :authors
  jsonapi_resources :books
end
