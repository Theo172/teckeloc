class ReservationsController < ApplicationController

  def new
    @teckel = Teckel.find(params[:teckel_id])
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @teckel = Teckel.find(params[:teckel_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.teckel = @teckel
    authorize @reservation
    if @reservation.save
      redirect_to profile_path(@teckel)
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date, :teckel_id, :user_id)
  end
end
