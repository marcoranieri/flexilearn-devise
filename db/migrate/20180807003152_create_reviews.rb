class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating

      t.references :tutor, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
