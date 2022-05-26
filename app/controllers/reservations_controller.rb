class ReservationsController < ApplicationController
  def show
  end


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
      redirect_to profile_path
    else
      render :new
    end

  end

  def destroy
    @reservation.destroy
    authorize @reservation
    redirect_to profile_path
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
