ActiveAdmin.register Student do

  permit_params :first_name, :last_name, :email, :phone

# Columns in INDEX table ------------------------------------------------------>
  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :email
    column :name
    column :created_at
    column :sign_in_count
    column :last_sign_in_at
    column :phone
    actions
  end

# Rows in SHOW page ----------------------------------------------------------->
  show do |event|
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row :name
      row :sign_in_count
      row :last_sign_in_at
      row :phone
      row :photo
      row :admin
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

# Form Field #NEW ------------------------------------------------------------->
  form do |f|
    f.inputs "Identity" do
      f.input :first_name
      f.input :last_name
      f.input :birthdate
      f.input :email
      f.input :phone
      f.input :bio
      f.input :pro
      f.input :photo
    end

    # Field LESSONS ----------------------------------------------------------->
# Declare here the form for the child model, using the "has_many" method:
    f.inputs "Lessons" do
      f.has_many :lessons, heading: false do |o|
        o.input :title
        o.input :request
        o.input :date
        o.input :time
        o.input :location
        o.input :status
        o.input :created_at, as: :string
        o.input :updated_at, as: :string
      end
    end

    f.actions
  end

# Filters --------------------------------------------------------------------->
  filter :first_name
  filter :last_name
  filter :email
  filter :phone
  filter :created_at
  filter :last_sign_in_at
  filter :sign_in_count
end
