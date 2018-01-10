class Member < ActiveRecord::Base
  belongs_to :library
  has_many :issue_histories
  enum gender: [ :male, :female]
end
