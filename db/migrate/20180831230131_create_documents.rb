class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :institute
      t.text :description
      t.string :qualification
      t.date :achieved
      t.integer :lvl
      t.integer :years_of_experience
      t.string :photo

      t.references :tutor, foreign_key: true

      t.timestamps
    end
  end
end
