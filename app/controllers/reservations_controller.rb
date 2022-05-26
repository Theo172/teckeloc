class ReservationsController < ApplicationController
  before_action :set_params, only: :destroy

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
  end

  def destroy
    @reservation.destroy
    redirect_to profile_path
  end

  private

  def set_params
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date)
  end
end
