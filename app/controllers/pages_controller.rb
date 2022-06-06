class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

    unless current_user.nil?
      @role = current_user.role
      @user = User.find(current_user.id)
      @butcheries = @user.butcheries if @role == 'seller'
      @products = Product.all
    end

    @products = Product.all
    # include orders when done
  end

  def show
    @user = User.find(current_user.id)
    @orders = Order.where(product: current_user.products)
    @butcheries = @user.butcheries

    @pending = @orders.where(order_status: false)
    @completed = @orders.where(order_status: true)
    @total_sales = 0
    @completed.each do |complete|
      product_id = complete.product_id
      product = Product.find(product_id)
      price = product.price * complete.quantity
      @total_sales += price
    end

    # Can look into including profit?
  end
end
