class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :last_name, presence: true
  validates :username, uniqueness: true

  has_many :reviews
  has_many :issues
  has_many :reviewed_products, through: :reviews, source: :product
  has_many :problem_products, through: :issues, source: :product
end
