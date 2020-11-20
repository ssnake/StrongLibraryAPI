Rails.application.routes.draw do
  root to: proc { [404, {}, ["Not found."]] }
  jsonapi_resources :authors
  jsonapi_resources :books
end
