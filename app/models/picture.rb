class Picture < ApplicationRecord
has_many :comments, :dependant => :destroy
end
