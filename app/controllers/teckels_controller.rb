class TeckelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :edit, :destroy, :update]
  before_action :set_params, only: [:show, :edit, :update, :destroy, :payment]


  def index
    if params[:query].present?
      @teckels = policy_scope(Teckel).search_by_teckel_characteristic(params[:query])
    else
      @teckels = policy_scope(Teckel).order(created_at: :desc)
    end
  end

  def show
    @reservation = Reservation.new
    authorize @teckel
  end

  def new
    @teckel = current_user.teckels.new
    authorize @teckel
  end

  def create
    @teckel = current_user.teckels.new(teckel_params)

    authorize @teckel
    if @teckel.save
      redirect_to teckel_path(@teckel)
    else
      render :new
    end
  end

  def edit
    authorize @teckel
  end

  def update
    @teckel.update(teckel_params)
    authorize @teckel
    redirect_to profile_path
  end

  def destroy
    @teckel.destroy
    authorize @teckel
    redirect_to profile_path
  end

  private

  def set_params
    @teckel = Teckel.find(params[:id])
  end

  def teckel_params
    params.require(:teckel).permit(:name, :species, :hair, :color, :age, :sex, :address, :special_features, :description, :anecdote, :price, :photo)
  end
end
