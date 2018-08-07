class AddFieldsToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :balance, :decimal
    add_column :students, :card, :string
    add_column :students, :phone, :string
    add_column :students, :bio, :text
    add_column :students, :birthdate, :date
    add_column :students, :status, :integer
    add_column :students, :pro, :boolean
    add_column :students, :like, :integer
  end
end
