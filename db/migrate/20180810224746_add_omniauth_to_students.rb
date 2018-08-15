class AddOmniauthToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :provider, :string
    add_column :students, :uid, :string
    add_column :students, :name, :string
    add_column :students, :image_fb, :string
  end
end
