class ReservationsController < ApplicationController
  def show
  end

  def new
    @teckel = Teckel.find(params[:teckel_id])
    @reservation = Reservation.new
  end

  def create
    @teckel = Teckel.find(params[:teckel_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.teckel = @teckel
    if @reservation.save
      redirect_to payment_path(@teckel)
    else
      render :new
    end
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
    params.require(:reservation).permit(:starting_date, :ending_date, :teckel_id, :user_id)
  end
end
