class Comment < ApplicationRecord
  belongs_to :picture
  validates_presence_of :name
  validates_presence_of :body
  validates_length_of :name,:within => 2..20
end
