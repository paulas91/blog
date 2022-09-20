class BasketAdress < ApplicationRecord
  belongs_to :adress
  belongs_to :basket
end
