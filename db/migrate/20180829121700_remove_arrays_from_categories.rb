class RemoveArraysFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :mytutor_ids
    remove_column :categories, :mystudents_ids
  end
end
