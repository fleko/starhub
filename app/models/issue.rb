class Issue < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :comment, length: { minimum: 20 }
  validates :status, inclusion: { in: %w(REPORTED INVESTIGATED FIX_IN_PROGRESS FIXED), message: "%{value} is not a valid status" }
  validates :severity, inclusion: { in: %w(COSMETIC MINOR MAJOR CRITICAL), message: "%{value} is not a valid severity level" }

end
