class Product < ApplicationRecord

  has_many :reviews
  has_many :issues
  has_many :reviewing_customers, through: :reviews, source: :customer
  has_many :complaining_customers, through: :issues, source: :customer

  validates :name, length: { minimum: 6 }
  validates :code, length: { is: 4 }
  validates :category, inclusion: { in: %w(BOARD STRATEGY ARCADE RPG SHOOTER), message: "%{value} is not a valid category" }

  def average_ratings
    return 0 if reviews.empty?
    reviews.map { |r| r.rating }.inject(:+) / reviews.size
  end

  def issue_count
    list = issues.map { |issue| issue.severity }
    counts = Hash.new(0)
    list.each { |issue| counts[issue] += 1 }
    counts
  end
end
