class Category < ApplicationRecord
  belongs_to :tutor

  validates :name, presence: :true, uniqueness: true
end
