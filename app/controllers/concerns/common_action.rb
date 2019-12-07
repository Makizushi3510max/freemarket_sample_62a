require 'active_support/concern'
module CommonActions

  extend ActiveSupport::Concern

  def set_categories
    @categories = Category.where(params[:id])
    @category_children1 = Category.where(parent_id: 1)
    @category_children2 = Category.where(parent_id: 2)
    @category_children3 = Category.where(parent_id: 3)
    @category_children4 = Category.where(parent_id: 4)
    @category_children5 = Category.where(parent_id: 5)
    @category_children6 = Category.where(parent_id: 6)
    @category_children7 = Category.where(parent_id: 7)
    @category_children8 = Category.where(parent_id: 8)
    @category_children9 = Category.where(parent_id: 9)
    @category_children10 = Category.where(parent_id: 10)
    @category_children11 = Category.where(parent_id: 11)
    @category_children12 = Category.where(parent_id: 12)
    @category_children13 = Category.where(parent_id: 13)
  end
end