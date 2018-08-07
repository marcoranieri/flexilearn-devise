class PagesController < ApplicationController
  def login
    @student = Student.new
    @tutor = Tutor.new
  render 'login/login'
  end
end
