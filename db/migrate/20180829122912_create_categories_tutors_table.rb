class CreateCategoriesTutorsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_tutors do |t|
      t.belongs_to :tutor, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
