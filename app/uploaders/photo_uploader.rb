class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # process eager: true  # Force version generation at upload time.

  # process convert: 'jpg'

  # version :thumnail do
  #   resize_to_fit 256, 256
  # end

  version :bright_face do
    cloudinary_transformation effect: "brightness:20", radius: "max",
      width: 150, height: 150, crop: :thumb, gravity: :face
  end
  version :bright_face_small do
    cloudinary_transformation effect: "brightness:20", radius: "max",
      width: 75, height: 75, crop: :thumb, gravity: :face
  end
  # <!-- app/views/articles/show.html.erb -->
  # <%= image_tag @article.photo.url(:bright_face) %>

end
