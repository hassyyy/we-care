class DonationPolicy < ApplicationPolicy

  def destroy?
    user.account_admin? && record.resource.internal?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
