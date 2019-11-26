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

  def create
    binding.pry
    Product.create(product_params)
    redirect_to products_path
  end

  def purchase
  end

  def done
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :condition, :category_id, :size_id, :shipping_cost, :shipping_area, :shipping_date, :price, images: []).merge(seller_id: current_user.id)
  end
end