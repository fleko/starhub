require 'test_helper'

describe ReviewsController do
  before do
    @product = products(:backgammon)
    @review = reviews(:two)
    sign_in customers(:sarah)
  end

  describe "Review read methods" do
    it "gets index" do
      get  product_reviews_url( @product)
      must_respond_with :success
    end

    it "gets new review" do
      get  new_product_review_url( @product )
      must_respond_with :success
    end

    it "show review" do
      get  product_review_url( @review.product, @review )
      must_respond_with :success
    end

    it "edits review" do
      get  edit_product_review_url( @review.product, @review )
      must_respond_with :success
    end
  end

  describe "Review write methods" do
    it "updates review" do
      updated_review = {
        comment: "This is a new comment"
      }
      patch product_review_url(@product, @review), params: { review: updated_review }
      must_redirect_to product_review_url(@product, @review)
    end

    it "creates review" do
      new_review = {
        rating: 2,
        comment: "The graphics are not so good"
      }
      expect(lambda do
               post product_reviews_url( @product), params: { review: new_review }
      end).must_change "Review.count"

      must_redirect_to product_review_url(@product, @product.reviews.last)
    end

    it "destroys review" do
      expect(lambda do
               delete product_review_url(@review.product, @review)
      end).must_change('Review.count', -1)

      must_redirect_to product_reviews_url
    end
  end

end
