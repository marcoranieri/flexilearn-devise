class Document < ApplicationRecord
  belongs_to :tutor

  mount_uploader :photo, PhotoUploader

end
