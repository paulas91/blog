class Basket < ApplicationRecord
  belongs_to :shop
  has_many :products
end
