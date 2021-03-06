class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Cloudinary
  mount_uploader :photo, PhotoUploader

  has_many :lessons
  has_many :reviews
  has_many :tutors, through: :lessons
  has_many :reviews, through: :tutors
  has_many :orders

  # For use nested form for lessons in ActiveAdmin
  accepts_nested_attributes_for :lessons

  # validates :password, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :phone, presence: true, uniqueness: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  enum status: [ :available, :unavailable ]

# //// Omniauth - Facebook ///////////////////////////////
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.image_fb = auth.info.image
    end
  end
# ///////////////////////////////////////////////////////

end # /class Student ---------------------------------------------------------->


def find_student(student_id)
  Student.find(student_id)
end
