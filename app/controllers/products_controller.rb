class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @products = Product.find(params[:id])
    @butchery = @product.butchery
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product), notice: 'Product was successfully created'
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

  def product_params
    params.require(:product).permit(:name, :price, :country, :expiration_date)
  end
end
