class PagesController < ApplicationController
  def signup
    @student = Student.new
    @tutor = Tutor.new
  render 'signup/signup'
  end
end
