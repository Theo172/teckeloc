class ReservationsController < ApplicationController
  before_action :set_params, only: [:edit, :update]

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
      flash[:notice] = 'your reservation is pending!'
      redirect_to profile_path
    else
      render :new
    end
  end
  def edit
    @user = current_user
    @teckel = Teckel.find(params[:teckel_id])
    authorize @reservation
  end

  def update
    @reservation.update(reservation_params)
    authorize @reservation
  end

  private

  def set_params
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date, :teckel_id, :user_id, :status)
  end
end
