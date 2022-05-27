class UsersController < ApplicationController
  def profile
    @user = current_user
    authorize @user
    @reservation = Reservation.new
    @asked_reservations = @user.teckels.map(&:reservations).flatten
  end

end
