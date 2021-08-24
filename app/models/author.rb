class Author < ApplicationRecord
	has_many :books
	has_many :publisher, through: :books
end
