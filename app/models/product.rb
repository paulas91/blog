class Product < ApplicationRecord
  has_many :basket_products, dependent: :destroy
  has_many :shop_products, dependent: :destroy
  has_many :shops, through: :shop_products
  belongs_to :category
  
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize: "100x100"
    attachable.variant :medium, resize: "300x300"
  end
end
