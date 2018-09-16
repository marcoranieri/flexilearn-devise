class CreateIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :identities do |t|
      t.string :name
      t.integer :document_type, default: 0, null: false
      t.string :document_number, null: false
      t.date :expired
      t.string :nationality
      t.text :notes
      t.string :photo

      t.references :tutor, foreign_key: true

      t.timestamps
    end
  end
end
