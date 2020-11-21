class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController
  # skip_before_action :verify_authenticity_token
end
