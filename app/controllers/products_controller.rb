class ProductsController < ApplicationController
  # before_action :set_user
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_butchery, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.butchery = @butchery
    if @product.save
      redirect_to butchery_path(@butchery), notice: 'Product was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_butchery
    @butchery = Butchery.find(params[:butchery_id])
  end

  def set_butcheries
    @butcheries = current_user.butcheries
  end

  def product_params
    params.require(:product).permit(:name, :price, :country, :expiration_date)
  end
end
