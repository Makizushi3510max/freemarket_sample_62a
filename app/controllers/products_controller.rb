class ProductsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @product = Product.new
    @categories = Category.all
    @sizes = Size.all
    # @root_categories = Category.roots
  end

  def get_category_children
    # @category_children = Category.find(params[:root_category_id]).children
    # binding.pry
    # respond_to do |format|
    #   format.json
    # end
    @category_children = Category.find(params[:root_category_id]).children
    respond_to do |format|
      format.json
    end
    # binding.pry
  end


  def create
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

  # def set_category
  #   Category.find_by(id: "#{params.require(:product).permit(:category_id)["category_id"]}")
  # end
end


# Category.find_by(id: "#{18}")
# id: 18, name: "Tシャツ/カットソー(半袖/袖なし)", created_at: Sat, 23 Nov 2019 08:07:41 UTC +00:00, updated_at: Sat, 23 Nov 2019 08:07:41 UTC +00:00, ancestry: "2/6">
# [17] pry(#<ProductsController>)>   ;

# params.require(:product).permit(:category_id).to_h
# Unpermitted parameters: :name, :description, :condition, :shipping_cost, :shipping_area, :shipping_date, :price
# => {"category_id"=>"18"}

# hoge = params.require(:product).permit(:category_id).to_h
# hoge["category_id"]
# => "18"