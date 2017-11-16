class ReviewsController < ApplicationController
  before_action :set_product

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @product.reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = @product.reviews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :show, status: :ok, location: @review }
    end
  end

  # GET /reviews/new
  def new
    @review = @product.reviews.build

    respond_to do |format|
      format.html
      format.json { render json: @review}
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = @product.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    create_params = review_params.merge({ customer_id: current_customer.id })
    @review = @product.reviews.create(create_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to [@review.product, @review], notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: [@review.product, @review] }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review = @product.reviews.find(params[:id])

    respond_to do |format|
      update_params = review_params.merge({ customer_id: current_customer.id })
      if @review.update_attributes(update_params)
        format.html { redirect_to [@review.product, @review], notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = @product.reviews.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to product_reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
