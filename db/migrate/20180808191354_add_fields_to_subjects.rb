class AddFieldsToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :description, :text
    add_column :subjects, :price, :decimal
    add_reference :subjects, :tutor, foreign_key: true
  end
end
