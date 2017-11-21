class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :comment, length: { minimum: 10 }
  validates :rating, inclusion: { in: (1..5).to_a }

  def broadcast_save
    ActionCable.server.broadcast 'notification', status: 'created',
      id: id,
      product: self.product.name,
      reviewer: self.customer.username,
      rating: rating
  end
end
