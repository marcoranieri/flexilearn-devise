ActiveAdmin.register Document do

  belongs_to :tutor

  permit_params :name, :institute, :description, :qualification, :achieved,
                :lvl, :years_of_experience, :photo

# Columns in INDEX table ------------------------------------------------------>
  # index do
  #   selectable_column
  #   column :tutor_id do |d|
  #     link_to("#{d.tutor.first_name} #{d.tutor.last_name}",
  #             admin_tutor_path(d.tutor))
  #   end
  #   column :name
  #   column :institute
  #   column :description
  #   column :qualification
  #   column :achieved
  #   column :lvl
  #   column :years_of_experience
  #   column :created_at
  #   column :updated_at
  #   actions
  # end

# Rows in SHOW page ----------------------------------------------------------->
  show do |event|
    attributes_table do
      row :tutor_id do |i|
        link_to("#{i.tutor.first_name} #{i.tutor.last_name}",
              admin_tutor_path(i.tutor))
      end
      row :name
      row :institute
      row :qualification
      row :description
      row :achieved
      row :lvl
      row :photo
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|# Form Field #NEW  ----------------------------------------------->
    f.inputs "Document" do
      f.input :name
      f.input :institute
      f.input :qualification
      f.input :description
      f.input :achieved
      f.input :lvl
      f.input :photo
    end
    f.actions
  end


# Filters --------------------------------------------------------------------->
  # filter :name
  # filter :institute
  # filter :lvl
end
