class Shop < ApplicationRecord
  validates :name, :domain, :description, :adress, :phone, presence: true
  validates :name, :domain, uniqueness: true

  def url
    "http://#{domain}"
  end
end
