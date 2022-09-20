class Delivery < ApplicationRecord
  has_many :baskets

  enum kind: %i[addressable click_and_collect]
end
