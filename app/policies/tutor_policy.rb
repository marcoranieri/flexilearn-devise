class TutorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user == record
  end

  def show?
    return true if user.id == record.id
    return true if user.is_a?(Tutor) && user.lessons.find(student_id = record.id)
  end

  def create?
    user == record.id
  end

  def update?
    user == record
  end

  def destroy?
    record == user
  end

end
