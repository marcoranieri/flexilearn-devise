ActiveAdmin.register Category do

  permit_params :name, :description

# Columns in INDEX table ------------------------------------------------------>
  index do
    selectable_column
    # column :tutor_id do |d|
    #   link_to("#{d.tutor.first_name} #{d.tutor.last_name}",
    #           admin_tutor_path(d.tutor))
    # end
    column :name do |c|
      b c.name
    end
    column :description
    column :created_at
    column :updated_at
    actions
  end

  # Rows in SHOW page ----------------------------------------------------------->
  show do |event|
    attributes_table do
      row :name
      row :description
      row :tutor_id do |c|
        if c.tutors.present?
          c.tutors.map do |t|
            "#{t.first_name} #{t.last_name}"
          end.join(", ")
        else
          status_tag('Empty')
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

# Filters --------------------------------------------------------------------->
  filter :name
  filter :description
  filter :created_at
  filter :updated_at
end
