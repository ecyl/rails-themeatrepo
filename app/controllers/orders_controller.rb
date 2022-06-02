class OrdersController < ApplicationController
  # find the user
  before_action :find_product_qty, only: :show
  before_action :find_user, only: :show

  # view all orders
  def index
    @orders = Order.all
  end

  # create new orders
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    # assign order to user
    @order.user = @user

    if @order.save
      redirect_to user_product_orders(@user)
    else
      render :new
    end
  end

  def show
  end

  private

  def find_product_id
    @product_qty = ProductQty.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def butchery_params
    params.require(:order).permit(:order_status)
  end
end
