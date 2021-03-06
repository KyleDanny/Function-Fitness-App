class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      flash[:alert] = "You've left a review!"
      redirect_to dashboard_path(@booking_id)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :recommend)
  end
end
