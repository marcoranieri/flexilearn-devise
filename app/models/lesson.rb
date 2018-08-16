class Lesson < ApplicationRecord
  belongs_to :student
  belongs_to :tutor, optional: true
  belongs_to :category

  # validates :tutor, presence: :true
  # validates :student, presence: :true
  # validates :category, presence: :true

  enum status: [ :requested, :scheduled, :canceled ]

  # MoneyRails Gem
  monetize :price_cents
end
