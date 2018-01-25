class HomeController < ApplicationController
  def home
    @title = "Home"
    unless user_signed_in? 
      @books = Book.all
    else 
      @books = current_user.books.all
    end
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
end
