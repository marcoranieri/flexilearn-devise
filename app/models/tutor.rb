class Tutor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Cloudinary
  mount_uploader :photo, PhotoUploader

  has_many :reviews, dependent: :destroy
  has_many :categories, through: :lessons
  has_many :lessons
  has_many :documents
  has_many :students, through: :lessons

  has_and_belongs_to_many :categories

  has_one :identity

  # validates :password, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :phone, presence: true, uniqueness: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  enum status: [ :available, :unavailable ]

end # /class Tutor ------------------------------------------------------------>


def find_tutor(tutor_id)
  Tutor.find(tutor_id)
end
