class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
  end

  private

  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date)
  end
end
