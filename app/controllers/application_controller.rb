class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

def render_not_found(not_found)
  render json: { error: not_found.message }, status: :not_found
end


end
