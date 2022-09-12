class Commuter < ApplicationRecord
  has_one :ticket, dependent: :destroy
  has_one :parking_space, through: :ticket

  validates :license_plate_number, uniqueness: true
  validates :license_plate_number, length: { is: 8 }
  validates :vehicle_make_and_model, presence: true
end
