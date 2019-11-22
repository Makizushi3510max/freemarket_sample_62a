class Brand < ApplicationRecord
  has_many :products
  has_many :category_brands
  has_many :categories, through: :category_brands
end
