class AddOmniauthToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :provider, :string
    add_column :tutors, :uid, :string
    add_column :tutors, :name, :string
    add_column :tutors, :image_fb, :string
  end
end
