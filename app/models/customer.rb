class Customer < ApplicationRecord
  validates :last_name, presence: true
  validates :username, uniqueness: true
end
