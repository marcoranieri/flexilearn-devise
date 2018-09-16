class Identity < ApplicationRecord
  belongs_to :tutor

  mount_uploader :photo, PhotoUploader

  enum document_type: [ :passport, :national_id ]

end
