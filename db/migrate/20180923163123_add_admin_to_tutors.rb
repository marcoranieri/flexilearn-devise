class AddAdminToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :admin, :boolean, null: false, default: false
  end
end
