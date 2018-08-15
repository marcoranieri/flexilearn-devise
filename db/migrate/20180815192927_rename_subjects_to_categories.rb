class RenameSubjectsToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :subjects, :categories
  end
end
