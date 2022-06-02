class OrdersController < ApplicationController
  # find the user
  before_action :find_product_id, only: [:show, :create, :new]
  # before_action :find_user, only: [:show, :new, :create]

  # view all orders
  def index
    @orders = Order.all
  end

  # create new orders
  def new
    # @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    # assign order to user
    @order.user = current_user
    @order.product = @product

    if @order.save
      redirect_to product_orders_path(@product)
    else
      render :new
    end
  end

  def show
  end

  private

  def find_product_id
    @product = Product.find(params[:product_id])
  end

  # def find_user
  #   @user = User.find(params[:user_id])
  # end

  def order_params
    params.require(:order).permit(:quantity)
  end
end
