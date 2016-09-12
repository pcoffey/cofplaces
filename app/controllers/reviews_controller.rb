class ReviewsController <ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]
  
  def edit
  end
  
  def create
    @review = current_user.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to place_path(@review.place), notice: 'Review was successfully created.' }
        
      else
        format.html { render :new }
        
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to place_path(@review.place), notice: 'Review was successfully updated.' }
        
      else
        format.html { render :edit }
        
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to places_path(@review.place), notice: 'Review was successfully destroyed.' }
      
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content, :place_id, :score )
    end
end