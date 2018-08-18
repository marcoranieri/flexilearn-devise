class LessonsController < ApplicationController
  # skip_before_action :authenticate_student!, only: :home
  # skip_before_action :authenticate_tutor!, only: :home
  before_action :find_lesson, only: [ :show, :edit, :update, :destroy ]

  def index
    # current_student ? @lessons = policy_scope(Lesson).where(student: current_student) : @lessons = policy_scope(Lesson).where(tutor: current_tutor) if current_tutor
    if current_user.is_a? Student
      @lessons = policy_scope(Lesson).where(student: current_user).order(created_at: :desc)
    else
      @lessons = policy_scope(Lesson).where(tutor: current_user).order(created_at: :desc)
    end
      # @lessons = policy_scope(Lesson).where(tutor: current_tutor) if current_tutor
      # @lessons = policy_scope(Lesson).order(created_at: :desc)
      authorize @lessons
  end

  def show
    @q = "<i class='fas fa-question'></i>".html_safe
  end

  def new
    @lesson = Lesson.new
    authorize @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.student = current_student
    authorize @lesson

    respond_to do | format |
      if @lesson.save!
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do | format |
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson.destroy
    respond_to do | format |
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_lesson
    @lesson = Lesson.find(params[:id])
    authorize @lesson # Auth before_action :show, :edit, :update, :destroy
  end

  def lesson_params
    params.require(:lesson).permit(:id, :student_id, :category_id, :tutor_id, :date, :title, :request, :time, :location, :status, :notes, :tutor_notes, :photo, :price_cents )
  end
end
