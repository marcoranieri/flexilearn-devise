class Review < ApplicationRecord
  belongs_to :tutor
  validates :tutor, presence: true

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true

  def find_reviewer(reviewer_id)
    Student.find(reviewer_id)
  end

end
