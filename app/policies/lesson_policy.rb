class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    return true if user.is_a?(Student) && user.created_at #is saved?
    user.is_a? Tutor
  end

  def create?
    # Only Student can create a Lesson
    user.is_a? Student
  end

  def update?
    # Only Student can create a Lesson
    return user == record.student if user.is_a? Student
    record.tutor.nil? if user.is_a? Tutor
  end

  def destroy?
    user.is_a? Student
  end
end
