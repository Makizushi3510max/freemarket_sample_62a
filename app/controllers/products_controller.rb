class ProductsController < ApplicationController
  def index
    @products = Product.all
    @ladies = []
    @mens  = []
    @electronics = []
    @toys = []
    @products.each_with_index do |product ,i|
      if product.category.parent.parent.id == 1
        @ladies << product
      end

      if product.category.parent.parent.id == 417
        @mens << product
      end

      if product.category.parent.parent.id == 1181
        @electronics << product
      end

      if product.category.parent.parent.id == 946
        @toys << product 
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    @sellers_products = Product.where(seller_id: @product.seller).limit(6)
    @brands_products = Product.where(brand: @product.brand).limit(6)
  end

  def destroy
    product = Product.find(params[:id])
    if product.seller.id == current_user.id
      product.destroy
    end
    redirect_to root_path
  end
  
  def new
    @product = Product.new
    @categories = Category.all
    @sizes = Size.all
    session[:images] = []
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
    # binding.pry
    # i = params.require(:images_length).to_i - 1
    # for num in 0..i do
    #   # puts %I(image#{num})
    #   session[:images].push(params.require(%I(image#{num})))
    # end
    # binding.pry
    # respond_to do |format|
    #   format.json
    # end
  end

  def create
    # Product.create(product_params)
    i = params.require(:images_length).to_i - 1
    for num in 0..i do
      # puts %I(image#{num})
      session[:images].push(params.require(%I(image#{num})))
    end
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
      images:           session[:images]
    )
    session.clear
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