ActiveAdmin.register Lesson do

permit_params :title, :request, :date, :time, :location, :status, :notes, :tutor_notes, :private, :category, :photo

# Columns in INDEX table ------------------------------------------------------>
  index do
    selectable_column
    column :id
    column :student do |lesson|
      if lesson.student.present?
        link_to lesson.student.last_name, admin_student_path(lesson.student)
      else
        status_tag('Empty')
      end
    end
    column :tutor do |lesson|
      if lesson.tutor.present?
        link_to lesson.tutor.last_name, admin_tutor_path(lesson.tutor)
      else
        status_tag('Empty')
      end
    end
    column :title
    column :category
    column :date
    column :status
    column :private
    column :created_at
    column :updated_at
    column :price_cents
    column :photo
    actions
  end

# Rows in SHOW page ----------------------------------------------------------->
  show do |event|
    attributes_table do
    row :student do |lesson|
      if lesson.student.present?
        link_to lesson.student.last_name, admin_student_path(lesson.student)
      else
        status_tag('Empty')
      end
    end
    row :tutor do |lesson|
      if lesson.tutor.present?
        link_to lesson.tutor.last_name, admin_tutor_path(lesson.tutor)
      else
        status_tag('Empty')
      end
    end
      row :title
      row :request
      row :date
      row :time
      row :location
      row :status
      row :notes
      row :tutor_notes
      row :photo
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # Form Field #NEW ----------------------------------------------------------->
  form do |f|
    f.inputs "Identity" do
      f.input :title
      f.input :category
      f.input :request
      f.input :date
      f.input :time
      f.input :location
      f.input :status
      f.input :notes
      f.input :tutor_notes
      f.input :private
      f.input :price_cents
      f.input :photo
    end
    f.actions
  end

  action_item :requested, only: :show do # REQUESTED btn ---------------------->
    link_to "Requested", requested_admin_lesson_path(lesson), method: :patch
  end

  member_action :requested, method: :patch do
    lesson = Lesson.find(params[:id])
    lesson.update(status: "requested")
    redirect_to admin_lesson_path(lesson)
  end

  action_item :scheduled, only: :show do # SCHEDULED btn ---------------------->
    link_to "Schedule", scheduled_admin_lesson_path(lesson), method: :patch
  end

  member_action :scheduled, method: :patch do
    lesson = Lesson.find(params[:id])
    lesson.update(status: "scheduled")
    redirect_to admin_lesson_path(lesson)
  end

  action_item :completed, only: :show do # COMPLETED btn ---------------------->
    link_to "Completed", completed_admin_lesson_path(lesson), method: :patch
  end

  member_action :completed, method: :patch do
    lesson = Lesson.find(params[:id])
    lesson.update(status: "completed")
    redirect_to admin_lesson_path(lesson)
  end

  action_item :canceled, only: :show do # CANCELED btn ------------------------>
    link_to "Canceled", canceled_admin_lesson_path(lesson), method: :patch
  end

  member_action :canceled, method: :patch do
    lesson = Lesson.find(params[:id])
    lesson.update(status: "canceled")
    redirect_to admin_lesson_path(lesson)
  end

# preserve_default_filters! # DEAFAULT filters -------------------------------->
  remove_filter :tutor
  remove_filter :student
  filter :title
  filter :request
  filter :date
  filter :location
  filter :status
  filter :created_at
  filter :updated_at
  filter :price_cents
end
