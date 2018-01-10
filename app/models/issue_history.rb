class IssueHistory < ActiveRecord::Base
  belongs_to :member
  has_many :books
end
