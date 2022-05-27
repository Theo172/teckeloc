class ChangeStatusToReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :status, :string, default: "Pending"
  end
end
