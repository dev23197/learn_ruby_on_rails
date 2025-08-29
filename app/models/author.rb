class Author < ApplicationRecord
  has_many :novels
  validates :name, presence: true
end
