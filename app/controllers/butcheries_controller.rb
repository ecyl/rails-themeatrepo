class ButcheriesController < ApplicationController
  before_action :find_butcher, only: :show
  # create butchery
  # view all possible bucheries
  # view information about a butchery

  def new
    @butcher = Butcher.new
  end

  def create
    @butcher = Butcher.new(butcher_params)

    if @butcher.save
      redirect_to user_butcheries_path
    else
      render :new
    end
  end

  def show
  end

  private

  def find_butcher
    @butcher = Butcher.find(params[:id])
  end

  def find_user

  end

  def butcher_params
    params.require(:butcher).permit(:name, :address, :phone_number)
  end
end
