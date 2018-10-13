ActiveAdmin.register Review do

  belongs_to :tutor
  permit_params :title, :content, :rating

# Columns in INDEX table ------------------------------------------------------>
  index do
    selectable_column
    column :id
    column :title
    column :content
    column :rating
    column :tutor do |review|
      if review.tutor.present?
        link_to review.tutor.last_name, admin_tutor_path(review.tutor)
      else
        status_tag('Empty')
      end
    end
    column :reviewer do |review|
      if review.reviewer_id.present?
        link_to review.student.last_name,
                admin_student_path(review.student)
      else
        status_tag('Empty')
      end
    end

    actions
  end

# Rows in SHOW page ----------------------------------------------------------->
  show do |event|
    attributes_table do
      row :id
      row :title
      row :content
      row :rating
      row :created_at
      row :updated_at
      row :tutor do |review|
        if review.tutor.present?
          link_to("#{review.tutor.first_name} #{review.tutor.last_name}",
                  admin_tutor_path(review.tutor))
        else
          status_tag('Empty')
        end
      end
      row :reviewer do |review|
        if review.reviewer_id.present?
          link_to("#{review.student.first_name}
                   #{review.student.last_name}",
                  admin_student_path(review.student))
        else
          status_tag('Empty')
        end
      end
    end
    active_admin_comments
  end


# Form Field #NEW
  form do |f|
    f.inputs "Insert details" do
      f.input :title
      f.input :content
      f.input :rating
    end
    f.actions
  end

  preserve_default_filters! # DEAFAULT filters too
  # filter :tutor_id , as: :select, collection: Tutor.all.map(&:last_name)
  # filter :tutor, label: "marcoTutotor", collection: -> {
  #   Tutor.all.map { |dev| dev.last_name }.sort
  # }
  remove_filter :tutor
  remove_filter :reviewer_id
end
