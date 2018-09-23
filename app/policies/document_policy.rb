class DocumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user == record.tutor
  end

  def create?
    true
  end

  def update?
    user == record.tutor
  end

  def destroy?
    record.tutor == user
  end

end
