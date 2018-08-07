class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
  end

  def create
  end

end
