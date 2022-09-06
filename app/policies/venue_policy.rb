class VenuePolicy < ApplicationPolicy
  class Scope < Scope

  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def update?
    record.user == current_user
  end

  def destroy?
    record.user == current_user
  end
end
