ActiveAdmin.register Student do

  permit_params :first_name, :last_name, :email, :phone, :bio

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
    column :reviews do |student|
      Review.all.select{|r| r.student.id == student.id}.count
    end
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
      row :reviews do |student|
        student_reviews = Review.all.select{|r| r.student.id == student.id}
        if student_reviews.present?
          b "This student wrote in total #{student_reviews.count} review(s)"
          ul do
            student_reviews.map do |review|

              li h4 b link_to("#{review.title}", admin_tutor_review_path(review.tutor,review))
              li "#{review.content}"
              li b em small "#{review.tutor.first_name}
                             #{review.tutor.last_name} |
                             Rating: #{review.rating} / 5"
              li "- - - - - - - - - - - - - § - - - - - - - - - - - - - -"
            end
          end
        else
          status_tag('Empty')
        end
      end
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
