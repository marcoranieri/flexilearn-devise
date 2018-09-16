class IdentityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    false
  end

  def show?
    user == record.tutor
  end

  def create?
#    user == record.tutor
true
  end

  def update?
    user == record.tutor
  end

  def destroy?
    user.is_a?(Tutor) &&
    record.tutor == user
  end

end
