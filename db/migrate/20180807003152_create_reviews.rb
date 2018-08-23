class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :tutor, foreign_key: true
      t.string :title
      t.text :content
      t.integer :rating
      #t.integer :reviewer_ids, default: [], array: true
      t.integer :reviewer_id
      t.timestamps
    end
  end
end
