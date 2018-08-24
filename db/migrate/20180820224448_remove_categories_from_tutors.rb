class RemoveCategoriesFromTutors < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :tutor_id
  end
end
