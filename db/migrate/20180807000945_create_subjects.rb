class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :mytutor_ids, default: [], array: true
      t.integer :mystudent_ids, default: [], array: true

      t.timestamps
    end
  end
end
