class ResourcePolicy < ApplicationPolicy
  def update?
    user.account_admin?
  end

  def attach_donation?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
