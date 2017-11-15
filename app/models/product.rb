class Product < ApplicationRecord

  has_many :reviews
  has_many :issues
  has_many :reviewing_customers, through: :reviews, source: :customer
  has_many :complaining_customers, through: :issues, source: :customer

  validates :name, length: { minimum: 6 }
  validates :code, length: { is: 4 }
  validates :category, inclusion: { in: %w(BOARD STRATEGY ARCADE RPG SHOOTER), message: "%{value} is not a valid category" }

end
