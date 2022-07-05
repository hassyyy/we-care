class ContributionPolicy < ApplicationPolicy
  def create?
    ::Avo::App.current_user.contributions.where(month: Date.today.strftime("%b"), year: Date.today.year).none?
  end

  def edit?
    record.status.eql?('submitted') and (user.account_admin? or record.user.eql?(::Avo::App.current_user))
  end

  def update?
    user.account_admin? or (record.user.eql?(::Avo::App.current_user) and record.status.eql?('submitted'))
  end

  def show?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
