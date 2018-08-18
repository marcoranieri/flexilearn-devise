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

  def all
    @lessons = Lesson.all.where(tutor: nil).order(created_at: :desc)
    @u = current_user # for refactoring the IF statement
  end

end
