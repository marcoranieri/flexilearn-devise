class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :student, foreign_key: true
      t.references :tutor, foreign_key: true
      t.string :title
      t.text :request
      t.date :date
      t.time :time
      t.string :location
      t.integer :status, default: 0, null: false
      t.text :notes
      t.text :tutor_notes

      t.timestamps
    end
  end
end
