class AddPhotoToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :photo, :string
  end
end
