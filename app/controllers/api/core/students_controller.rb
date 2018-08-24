class Api::Core::StudentsController < Api::Core::BaseController
  def show
    @student = Student.find(params[:id])
  end
end
