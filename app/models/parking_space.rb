class ParkingSpace < ApplicationRecord
  has_one :ticket
  has_one :commuter, through: :ticket
end
