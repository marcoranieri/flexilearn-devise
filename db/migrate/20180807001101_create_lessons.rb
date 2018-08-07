class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :student, foreign_key: true
      t.references :tutor, foreign_key: true
      t.references :subject, foreign_key: true
      t.date :date
      t.time :time
      t.string :location
      t.integer :status
      t.decimal :price
      t.text :notes

      t.timestamps
    end
  end
end
