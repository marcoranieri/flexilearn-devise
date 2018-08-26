class Lesson < ApplicationRecord
  belongs_to :student
  belongs_to :tutor, optional: true
  belongs_to :category

  # validates :tutor, presence: :true
  # validates :student, presence: :true
  # validates :category, presence: :true

  enum status: [ :requested, :scheduled, :completed, :canceled ]

  # Carriervawe
  mount_uploader :photo, PhotoUploader
  # MoneyRails Gem
  monetize :price_cents

  # Adding to favourite when a tutor click CONFIRM btn
  def add_tutor_to_favourite(student, lesson_id)
    # |= Appending Unique value
    student.mytutor_ids |= [lesson_id]
    student.save!
  end
end

def find_lesson(lesson_id)
  Lesson.find_by_id(lesson_id)
end
