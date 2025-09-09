class ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: params[:id])
    if @product
      render :show   # normal template
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end
end
