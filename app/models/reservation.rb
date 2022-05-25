class Reservation < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :teckel, dependent: :destroy
end
