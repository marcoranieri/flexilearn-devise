class AddTutorLvlToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :tutor_lvl, :integer, null: false, default: 1
  end
end
