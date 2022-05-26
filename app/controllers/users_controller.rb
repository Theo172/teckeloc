class UsersController < ApplicationController
  def profile
    @user = current_user
    authorize @user
    @reservations = Reservation.where(user_id: current_user.id)
  end

end
