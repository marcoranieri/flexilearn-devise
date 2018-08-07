class Review < ApplicationRecord
  belongs_to :tutor
  validates :tutor, presence: true
end
