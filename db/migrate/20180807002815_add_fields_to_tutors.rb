class AddFieldsToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :first_name, :string
    add_column :tutors, :last_name, :string
    add_column :tutors, :balance, :decimal
    add_column :tutors, :card, :string
    add_column :tutors, :phone, :string
    add_column :tutors, :bio, :text
    add_column :tutors, :birthdate, :date
    add_column :tutors, :status, :integer
    add_column :tutors, :pro, :boolean
    add_column :tutors, :like, :integer
    add_column :tutors, :level, :integer
    add_column :tutors, :degree, :string
    add_column :tutors, :institution, :string
    add_column :tutors, :desirability, :decimal
    add_column :tutors, :specialties, :text
    add_column :tutors, :qualifications, :text
  end
end
