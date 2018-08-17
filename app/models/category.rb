class Category < ApplicationRecord

  belongs_to :tutor
  has_many :lesson
  has_many :tutor, through: :lesson

  validates :name, presence: :true, uniqueness: true

end
