class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end 

  def create
    @review = Review.new(review_params)
 
  if @review.save
    redirect_to @review
  else
    render 'new'
  end
  end

   def show
    @review = Review.find(params[:id])
  end

  def index
    debugger
    @reviews = Review.all
  end

  private
    def review_params
      params.require(:review).permit(:name, :email, :text)
    end

end