class ProductsController < ApplicationController
  def index
    # @products = Product.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    @products = Product.all.order("id DESC").limit(10)
  end

  def show
  end
  
  def new
    @product = Product.new
    @categories = Category.all
    @sizes = Size.all
  end

  def get_category_children
    @category_children = Category.find(params[:root_category_id]).children
    respond_to do |format|
      format.json
    end
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_category_id]).children
    respond_to do |format|
      format.json
    end
  end

  def post_image
    binding.pry
    # respond_to do |format|
    #   format.json
    # end
  end

  def create
    # Product.create(product_params)
    # binding.pry
    @product = Product.create(
      name:             product_params[:name],
      description:      product_params[:description],
      condition:        product_params[:condition],
      category_id:      product_params[:grandchild_category_id],
      size_id:          product_params[:size_id],
      shipping_cost:    product_params[:shipping_cost],
      shipping_area:    product_params[:shipping_area],
      shipping_date:    product_params[:shipping_date],
      price:            product_params[:price],
      seller_id:        product_params[:seller_id],
      images:           product_params[:images]
    )
    redirect_to products_path
  end

  def purchase
  end

  def done
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :condition, :grandchild_category_id, :size_id, :shipping_cost, :shipping_area, :shipping_date, :price, images: []).merge(seller_id: current_user.id)
  end
end