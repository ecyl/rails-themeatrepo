class ButcheriesController < ApplicationController
  before_action :find_butcher, only: :show
  before_action :find_user, only: [:create, :show, :new]
  # create butchery
  # view all possible bucheries
  # view information about a butchery

  def index
    @butcheries = Butchery.all
  end

  def new
    @butchery = Butchery.new
  end

  def create
    @butchery = Butchery.new(butchery_params)
    # assign butcher to user
    @butchery.user = @user

    if @butchery.save
      redirect_to butcheries_path
    else
      render :new
    end
  end

  def show
  end

  private

  def find_butcher
    @butcher = Butchery.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def butchery_params
    params.require(:butchery).permit(:name, :address, :phone_number, :photo)
  end
end
