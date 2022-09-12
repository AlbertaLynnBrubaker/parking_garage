class CommutersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  def show
    render json: find_commuter, include: ['ticket'], status: :ok
  end

  def create
    c = Commuter.create!(commuter_params)
    t= Ticket.create!(commuter_id: c.id, parking_space_id: ParkingSpace.where(occupied: false).sample.id)
    t.parking_space.update(occupied: true)
    render json: c, include: ['ticket'], status: :created
  end

  def destroy
    c = find_commuter
    c.parking_space.update(occupied: false)
    c.destroy
    head :no_content
  end

  private 

  def find_commuter
    Commuter.find(params[:id])
  end

  def commuter_params
    params.permit(:vehicle_make_and_model, :license_plate_number)
  end

  def render_invalid(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
