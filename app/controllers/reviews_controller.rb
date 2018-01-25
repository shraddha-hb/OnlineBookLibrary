
class ReviewsController < ApplicationController

  before_action :load_book
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @book.reviews
    respond_to do |format|
      format.html { redirect_to @book }
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = @book.reviews.build
  end

  # GET /reviews/1/edit
  def edit
  end

  # book /reviews
  # book /reviews.json
  def create
    @review = @book.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to [@book, @review], notice: 'review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @review }
      else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update_attributes(review_params)
        format.html { redirect_to [@book, @review], notice: 'review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to book_reviews_url(@book) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
    	byebug
      @review = @book.reviews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :review_description, :reviewer_name)
    end

    def load_book
      @book = Book.find(params[:book_id])
    end
end
	# def create
	#   @book = Book.find(params[:book_id])
	  
	#   @review = @book.reviews.create!(review_params)
	#   redirect_to @book, :notice => "Review created!"
	# end

	# private

 #    # Never trust parameters from the scary internet, only allow the white list through.
 #    def review_params
 #      params.require(:review).permit(:title, :review_description, :reviewer_name)
 #    end
