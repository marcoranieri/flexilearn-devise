class Category < ApplicationRecord

  has_many :lesson
  has_many :tutor, through: :lesson

  validates :name, presence: :true, uniqueness: true

end
