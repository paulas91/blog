class Basket < ApplicationRecord
  include AASM
  belongs_to :shop
  has_many :products

  enum state: %i[init done cancel]

  aasm column: :state, enum: true do
    state :init, initial: true
    state :done
    state :cancell
  end

end
