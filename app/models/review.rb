class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :comment, length: { minimum: 10 }
  validates :rating, inclusion: { in: (1..5).to_a }

end
