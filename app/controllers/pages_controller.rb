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
end
