class UserPolicy < ApplicationPolicy

  def attach_contribution?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
