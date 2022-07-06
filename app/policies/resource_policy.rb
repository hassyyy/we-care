class ResourcePolicy < ApplicationPolicy
  def update?
    user.account_admin?
  end

  def attach_donations?
    false
  end

  def detach_donations?
    attach_donations?
  end

  def create_donations?
    user.account_admin?
  end

  def edit_donations?
    false
  end

  def destroy_donations?
    user.account_admin? and record.internal?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
