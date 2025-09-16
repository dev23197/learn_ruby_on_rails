class LibraryController < ApplicationController
  def show
    id = params.extract_value(:id)
    @book = Book.find(id)
  end
end
