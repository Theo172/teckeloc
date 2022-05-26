class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :teckel

  STATUS = %w[Pending Accept Decline]

  validates :status, inclusion: { in: STATUS }
end
