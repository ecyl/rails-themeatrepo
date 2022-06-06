class ProductsController < ApplicationController
  # before_action :set_user
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_butchery, except: [:index, :show]
  before_action :set_discounted_price, only: [:show]
  before_action :on_discount?, only: [:show]

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

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :country, :expiration_date, :discount_percentage, :photo)
  end

  # discount logic
  def on_discount?
    @product = set_product
    date_difference = @product.expiration_date - Date.today
    @on_discount = date_difference < 3
  end

  def set_discounted_price
    @product = set_product
    if @product.discount_percentage.nil?
      @discounted_price = (@product.price * (1 - (20 / 100.00))).round(2) if on_discount?
    else
      @discounted_price = (@product.price * (1 - (@product.discount_percentage / 100.00))).round(2) if on_discount?
    end
  end
end
