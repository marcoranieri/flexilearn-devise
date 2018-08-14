class Lesson < ApplicationRecord
  belongs_to :student
  belongs_to :tutor
  belongs_to :subject

  # validates :tutor, presence: :true
  # validates :student, presence: :true
  # validates :subject, presence: :true

  enum status: [ :requested, :scheduled, :canceled ]

  # MoneyRails Gem
  monetize :price_cents
end
