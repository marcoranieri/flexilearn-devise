class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :lessons
  has_many :tutors, through: :lessons

  # validates :password, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :phone, presence: true, uniqueness: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  enum status: [ :available, :unavailable ]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.image = auth.info.image
    end
  end

end