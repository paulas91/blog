class User < ApplicationRecord
  validates :first_name, :last_name, :birthday, :email, :phone, presence: true 
  scope :born_after, ->(year) { where("birthday >= '#{year}-01-01'") }

  def self.search(query)
    where("LOWER(first_name) LIKE LOWER(?)", sanitize_sql_like(query) + "%").or(
      where("LOWER(last_name) LIKE LOWER(?)", sanitize_sql_like(query) + "%")
    )
  end
end
