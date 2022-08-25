class Shop < ApplicationRecord
  validates :name, :domain, :description, :adress, :phone, presence: true
  validates :name, :domain, uniqueness: true
  scope :workers_number, -> (number) {where("workers_number >= #{number}") } 
  has_many :activities, as: :activitable
  has_many :shop_products
  has_many :products, through: :shop_products
  
  def self.search(query)
      where("LOWER(name) LIKE LOWER(?)", "%" + sanitize_sql_like(query) + "%").or(
        where("LOWER(domain) LIKE LOWER(?)", "%" + sanitize_sql_like(query) + "%")
      )
    end

  def url
    "http://#{domain}"
  end
end
