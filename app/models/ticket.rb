class Ticket < ApplicationRecord
  belongs_to :parking_space
  belongs_to :commuter

  validates :parking_space_id, uniqueness: true
end
