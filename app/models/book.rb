class Book < ApplicationRecord
 belongs_to :library, touch: true
 after_touch do
   Rails.logger.info("A Book was touched")
 end
end

class Library < ApplicationRecord
  has_many :books
  after_touch :log_when_books__or_library_touched

  private
  def log_when_books_or_library_touched
    Rails.longer.info("Books?Library was touched")
  end
end
