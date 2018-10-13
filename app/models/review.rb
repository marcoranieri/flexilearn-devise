class Review < ApplicationRecord
  belongs_to :tutor
  belongs_to :student
  validates :tutor, presence: true

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true

end
