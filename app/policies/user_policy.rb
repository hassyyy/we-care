class UserPolicy < ApplicationPolicy

  def update?
    create? or record.eql?(::Avo::App.current_user)
  end

  def attach_contributions?
    false
  end

  def detach_contributions?
    attach_contributions?
  end

  def create_contributions?
    ::Avo::App.current_user.contributions.where(month: Date.today.strftime("%b"), year: Date.today.year).none?
  end

  def view_contributions?
    false
  end

  def edit_contributions?
    false
  end

  def destroy_contributions?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
