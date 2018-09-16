class TutorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    user == record
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
