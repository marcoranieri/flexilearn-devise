ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns :class => 'dashboard' do
      column  :class => 'panel'do

        panel b do
          ul do
            h3 b "Most recent TUTORS:"
            Tutor.last(7).reverse.map do |tutor|
              li b link_to("#{tutor.first_name} #{tutor.last_name}",
                        admin_tutor_path(tutor))
              li tutor.email
              li em "Created at #{tutor.created_at.strftime("%e %b %Y")}"
              br
            end
          end
          end

        panel b do
          ul do
            h3 b "Most recent STUDENTS:"
            Student.last(7).reverse.map do |student|
              li b link_to("#{student.first_name} #{student.last_name}",
                        admin_student_path(student))
              li student.email
              li em "Created at #{student.created_at.strftime("%e %b %Y")}"
              br
            end
          end
          end

        panel b do
          ul do
            h3 b "Most recent LESSONS:"
            Lesson.last(7).reverse.map do |lesson|
              li b link_to("#{lesson.category.name} - #{lesson.title}",
                        admin_lesson_path(lesson))
              li link_to("> Student: #{lesson.student.first_name} #{lesson.student.last_name}",
                        admin_student_path(lesson.student))
              li link_to("> Tutor: #{lesson.tutor.first_name} #{lesson.tutor.last_name}",
                                      admin_tutor_path(lesson.tutor)) if lesson.tutor
              li em "Created at #{lesson.created_at.strftime("%e %b %Y")}"
              br
              end
          end
        end

        panel b do
          ul do
            h3 b "Most recent REVIEWS:"
            Review.last(7).reverse.map do |review|
              li b link_to("> TUTOR: #{review.tutor.first_name} #{review.tutor.last_name}",
                          admin_tutor_path(review.tutor))
              li b link_to("> Student: #{review.student.first_name} #{review.student.last_name}",
                          admin_student_path(review.student))
              li b "Title: #{review.title}"
              li "Content: #{review.content}"
              li em "Rating: #{review.rating} / 5"
              li em "Created at: #{review.created_at.strftime("%e %b %Y")}"
              br
              end
          end
        end
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    end
  end # content
end
