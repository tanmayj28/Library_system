class Book < ActiveRecord::Base
  belongs_to :library
  belongs_to :category
  belongs_to :issue_history
  has_many :issue_histories
end
