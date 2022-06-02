# class ProductQtiesController < ApplicationController
#   def new
#     @product = Product.find(params[:product_id])
#     @product_qty = ProductQty.new
#   end

#   def create
#     @product = Product.find(params[:product_id])
#     @product_qty = ProductQty.new(qty_params)
#     @product_qty.user
#     # ...save


#     # if @product_qty.save
#     # else
#     #   render:new
#     # end
#   end

#   private

#   def qty_params
#     params.require(:product_qty).permit(:quantity, :product_id, :user_id)
#   end
# end
