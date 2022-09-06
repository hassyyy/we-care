class DonationPolicy < ApplicationPolicy

  def destroy?
    user.account_admin? and record.resource.internal?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
