class ButcheriesController < ApplicationController
  before_action :find_butcher, only: :show
  # before_action :find_user, only: [:create, :show, :new]
  # before_action :set_user_role
  # create butchery
  # view all possible bucheries
  # view information about a butchery

  def index
    @butcheries = Butchery.all
  end

  def new
    @butchery = Butchery.new
  end

  def show
    @products = @butchery.products

    @markers = {
      lat: @butchery.latitude,
      lng: @butchery.longitude
    }
  end

  def create
    @butchery = Butchery.new(butchery_params)
    # assign butcher to user
    @butchery.user_id = current_user.id

    if @butchery.save
      redirect_to butchery_path(@butchery)
      # redirect_to user_butchery_products_path(@user, @butchery)
    else
      render :new
    end
  end

  private

  def find_butcher
    @butchery = Butchery.find(params[:id])
  end

  # def find_user
  #   @user = User.find(params[:user_id])
  # end

  # def set_user_role
  #   @role = current_user.role
  # end

  def butchery_params
    params.require(:butchery).permit(:name, :address, :phone_number, :photo)
  end

end
