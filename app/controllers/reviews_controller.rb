class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [ :new, :create ]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    # @review.save
    # respond_to do |format|
      if @review.save
        redirect_to restaurant_path(@restaurant)
        # format.html { redirect_to @review, notice: "review was successfully created." }
        # format.json { render :show, status: :created, location: @review }
      else
        render :new
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    # end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def review_params
      params.require(:review).permit(:rating, :content)
    end

end
