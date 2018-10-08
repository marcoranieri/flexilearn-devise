ActiveAdmin.register Identity do

  permit_params :name, :document_type, :document_number, :expired, :nationality,
                :notes, :photo

actions :all, except: [:new]

# Columns in INDEX table ------------------------------------------------------>
  index do
    selectable_column
    column :tutor_id do |i|
      link_to("#{i.tutor.first_name} #{i.tutor.last_name}",
              admin_tutor_path(i.tutor))
    end
    column :name
    column :document_type
    column :document_number
    column :expired
    column :nationality
    column :notes
    column :created_at
    column :updated_at
    actions
  end

# Rows in SHOW page ----------------------------------------------------------->
  show do |event|
    attributes_table do
      row :tutor_id do |i|
      link_to("#{i.tutor.first_name} #{i.tutor.last_name}",
              admin_tutor_path(i.tutor))
      end
      row :name
      row :document_type
      row :document_number
      row :expired
      row :nationality
      row :notes
      row :photo
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|# Form Field #NEW  ----------------------------------------------->
    f.inputs "Identity" do
      f.input :name
      f.input :document_type
      f.input :document_number
      f.input :expired
      f.input :nationality
      f.input :notes
      f.input :photo
    end
    f.actions
  end


# Filters --------------------------------------------------------------------->
  filter :name
  filter :document_number
  filter :nationality
end
