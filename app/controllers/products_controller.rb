class ProductsController < ApplicationController
  def index
    @products = Product.where.not(image_url: [nil, ""])
      .where.not(title: [nil, ""])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.find_or_initialize_by(upc: upc)
    LookupProductJob.perform_later(upc) if !@product.persisted?

    if @product.save
      redirect_to @product, notice: "Product UPC ##{upc} was saved."
    else
      render :new, alert: @product.errors.full_messages.join(". ")
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:upc)
  end

  def upc
    product_params[:upc]
  end
end
