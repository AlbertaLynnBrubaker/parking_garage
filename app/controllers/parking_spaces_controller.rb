class ParkingSpacesController < ApplicationController

  def index
    render json: ParkingSpace.all, status: :ok
  end
  
end
