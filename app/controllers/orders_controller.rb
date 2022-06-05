class OrdersController < ApplicationController
  # find the user
  before_action :find_product_id, only: [:show, :create, :new]
  # before_action :find_user, only: [:show, :new, :create]

  # view all orders
  def index
    # If is the seller
    # if current_user.role == "seller"
    #   # Return all orders for products he has created
    #   @orders = current_user.orders
    # else
    # # If is a buyer
    #   # Return all orders that he placed
    #   @orders = current_user.orders
    # end

    # refactoring
    @orders = current_user.orders
    @completed = @orders.where(order_status: true)
    @total_sales = 0
    @completed.each do |complete|
      product_id = complete.product_id
      product = Product.find(product_id)
      price = product.price * complete.quantity
      @total_sales += price
    end
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
      redirect_to orders_path(@product)
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
