class Review < ApplicationRecord
  belongs_to :tutor
  validates :tutor, presence: true

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true
end
