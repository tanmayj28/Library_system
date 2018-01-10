class Library < ActiveRecord::Base
	has_many :members
	has_many :books
end