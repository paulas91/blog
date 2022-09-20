class Adress < ApplicationRecord
  belongs_to :user
  has_many :basket_adresses
end
