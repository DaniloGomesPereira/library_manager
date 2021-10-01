class AuthorBook < ApplicationRecord
  belongs_to :author, dependent: :destroy
  belongs_to :book, dependent: :destroy
end
