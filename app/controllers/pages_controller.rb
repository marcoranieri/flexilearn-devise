class PagesController < ApplicationController

  def signup
    @student = Student.new
    @tutor = Tutor.new

    render 'pages/signup'
  end

  def login
    @student = Student.new
    @tutor = Tutor.new

    render 'pages/login'
  end

  def credential
    @navigation = true # Hide both Navbar/Footer

    @student = Student.new
    @tutor = Tutor.new

    render 'pages/credential'
  end

  def all
    @lessons = Lesson.all.where(tutor: nil, private: false).order(created_at: :desc)
    @u = current_user # for refactoring the IF statement
  end

def switch
  if current_user.is_a? Tutor
    redirect_to lessons_path
  else
    render 'pages/switch'
  end
end

  def mask
# Pototyping purpose (static tutor#show)
  end
  def documents
# Pototyping purpose (static tutor#show)
  end

end
