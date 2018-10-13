class StudentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
true
  end

  def show?
    return true if user.id == record.id
    return true if (user.lessons.pluck(:id) & record.lessons.pluck(:id)) != []
  end
end
