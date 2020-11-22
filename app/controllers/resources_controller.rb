class ResourcesController < ApplicationController
	include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  include JSONAPI::ActsAsResourceController
  before_action :authorize_access_request!
private
  def not_authorized
    render json: { error: "Not authorized" }, status: :unauthorized
  end  
end
