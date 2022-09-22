class Basket < ApplicationRecord
  include AASM
  STATES = %i[
    init
    confirmed
    adress_provided
    delivery_provided
    paid
    done
    cancelled
  ].freeze

  STATES_WITHOUT_CANCELLED = STATES - [:cancelled]

  belongs_to :delivery, optional: true
  belongs_to :user
  belongs_to :shop
  has_many :basket_adresses
  has_many :products, through: :basket_products
  has_many :basket_products, dependent: :destroy

  enum state: STATES

  aasm column: :state do
    state :init, initial: true
    state :confirmed
    state :adress_provided
    state :delivery_provided
    state :paid
    state :done
    state :cancelled

    event :confirm do
      transitions from: :init, to: :confirmed
    end
    event :choose_delivery do
      transitions from: :confirmed, to: :delivery_provided
    end
    event :provide_adress do
      transitions from: :delivery_provided, to: :adress_provided
    end
    event :pay do
      transitions from: [:delivery_provided, :adress_provided], to: :paid
    end
    event :finish do
      transitions from: %i[delivery_provided paid], to: :done
    end
    event :cancel do
      transitions from: STATES_WITHOUT_CANCELLED, to: :cancelled
    end
  end
end
