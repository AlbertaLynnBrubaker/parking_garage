class TicketsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  def render_invalid(invalid)
    render json: { errors: "Parking Space occupied, please choose another!" }, status: :unprocessable_entity
  end
end
