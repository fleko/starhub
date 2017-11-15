require 'test_helper'

describe Product do

  let(:monopoly) { products(:monopoly) }
  let(:backgammon) { products(:backgammon) }
  let(:duke) { products(:duke) }
  let(:stratego) { products(:stratego) }

  describe 'has_reviews' do
    it 'monopoly should have many reviews' do
      expect(monopoly.reviews.size).must_equal 2
    end

    it 'backgammon should have many reviews' do
      expect(backgammon.reviews.size).must_equal 2
    end

    it 'duke should have many reviews' do
      expect(duke.reviews.size).must_equal 1
    end

    it 'stratego should have no reviews' do
      expect(stratego.reviews.size).must_equal 0
    end
  end

  describe 'has_issues' do
    it 'monopoly should have many issues' do
      expect(monopoly.issues.size).must_equal 2
    end

    it 'stratego should have no issues' do
      expect(stratego.issues.size).must_equal 0
    end
  end

  describe 'has_reviewing_customers' do
    it 'monopoly should have many reviewing customers' do
      expect(monopoly.reviewing_customers.uniq.pluck(:username).size).must_equal 2
    end
  end

  describe 'has_complaining_customers' do
    it 'monopoly should have many complaining customers' do
      expect(monopoly.complaining_customers.uniq.pluck(:username).size).must_equal 1
    end
  end
end
