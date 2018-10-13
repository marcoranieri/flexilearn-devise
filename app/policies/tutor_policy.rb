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
    return true if (user.lessons.pluck(:id) & record.lessons.pluck(:id)) != []
  end

  def create?
    #user.lessons.pluck(:tutor_id).include?(record.id)
  end

  def update?
    user == record
  end

  def destroy?
    record == user
  end

end

# ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
#          ▀█▄▀▄▀██████ ▀█▄▀▄▀████▀
#            ▀█▄█▄███▀   ▀██▄█▄█▀﻿
