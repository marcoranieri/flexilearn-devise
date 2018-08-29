class Category < ApplicationRecord

  has_many :lesson
  has_many :tutor, through: :lesson
  has_and_belongs_to_many :tutors

  validates :name, presence: :true, uniqueness: true

end
