class TeckelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_params, only: [:show]

  def index
    @teckels = Teckel.all
  end

  def show
  end

  def new
    @teckel = current_user.teckels.new
  end

  def create
    @teckel = current_user.teckels.new(teckel_params)
    if @teckel.save
      redirect_to teckel_path(@teckel)
    else
      render :new
    end
  end

  private

  def set_params
    @teckel = Teckel.find(params[:id])
  end

  def teckel_params
    params.require(:teckel).permit(:name, :species, :hair, :color, :age, :sex, :address, :special_features, :description, :anecdote, :price, :photo)
  end
end
