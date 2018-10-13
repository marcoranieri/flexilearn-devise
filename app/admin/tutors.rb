ActiveAdmin.register Tutor do

  permit_params :admin, :first_name, :last_name, :email, :phone, :bio

# Columns in INDEX table  ----------------------------------------------------->
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
    column :reviews do |tutor|
      tutor.reviews.count
    end
    column :admin
    actions
  end

# Rows in SHOW page ----------------------------------------------------------->
  show do |event|
    attributes_table do
      row :id
      row :identity
      row :first_name
      row :last_name
      row :email
      row :name
      row :categories do |t|
        if t.categories.present?
          t.categories.map do |c|
            link_to c.name, admin_category_path(c)
          end
        else
          status_tag('Empty')
        end
      end
      row :sign_in_count
      row :last_sign_in_at
      row :phone
      row :photo
      row :admin
      row :created_at
      row :updated_at

      row :documents do |tutor|
        if tutor.documents.present?
          b "This tutor has in total #{tutor.documents.count} document(s)"
          ul do
            tutor.documents.map do |document|
              li h4 b link_to("#{document.name}",
                              admin_tutor_document_path(tutor.id,document))
              li "Institute: #{document.institute}"
              li "Qualification: #{document.qualification}"
              li b em small ""
              li "- - - - - - - - - - - - - § - - - - - - - - - - - - - -"
            end
          end
        else
          status_tag('Empty')
        end
      end

      row :reviews do |tutor|
        if tutor.reviews.present?
          b "This tutor has in total #{tutor.reviews.count} review(s)"
          ul do
            tutor.reviews.map do |review|
              li h4 b link_to("#{review.title}",
                              admin_tutor_review_path(tutor.id,review))
              li "#{review.content}"
              li b em small "#{review.student.first_name}
                             #{review.student.last_name} |
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

# Form Field #NEW  ------------------------------------------------------------>
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
# Form Field ADMIN ------------------------------------------------------------>
    f.inputs "Admin" do
      f.input :admin
    end

# Field LESSONS --------------------------------------------------------------->
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

# Field REVIEWS --------------------------------------------------------------->
# Declare here the form for the child model, using the "has_many" method:
    f.inputs "Reviews" do
      f.has_many :reviews, heading: false do |o|
        o.input :title
        o.input :content
        o.input :rating
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
  filter :admin
end
