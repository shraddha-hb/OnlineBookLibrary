# app/controllers/books_controller.rb
class Api::V1::BooksController < Api::V1::BaseController
  # before_action :set_book, only: [:show, :update, :destroy]
  include ActionController::MimeResponds
  # GET /books
  def index
    if params[:search].present?
	    searchterm = (params[:search])
			books = Book.where({ :name => /.*#{searchterm}.*/ })
		else
			books = Book.all
		end
    	json_response(books)
    # books = Book.all
  end
end