class DonationPolicy < ApplicationPolicy

  def edit?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
