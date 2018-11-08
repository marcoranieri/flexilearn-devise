class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(student: user)
    end
  end


  def create?
    true
  end
end
