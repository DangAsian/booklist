class BooksController < ApplicationController

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text
      format.json do
        render json: @books.map { |book_obj|
          {title: book_obj.title,
           author: book_obj.author }
          }
      end
      format.csv do
        render plain: @books.generate_csv(@books)
      end
    end
  end

end
