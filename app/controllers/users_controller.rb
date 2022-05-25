class UsersController < ApplicationController
  def profile
    @user = current_user
    @user.teckels
  end
end
