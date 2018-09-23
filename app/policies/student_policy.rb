class StudentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true if user.id == record.id
    return true if user.is_a?(Tutor) && user.lessons.find(student_id = record.id)
  end
end
