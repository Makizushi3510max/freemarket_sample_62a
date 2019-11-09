class ProductsController < ApplicationController
  def index
    render "products/_product"
  end
end
