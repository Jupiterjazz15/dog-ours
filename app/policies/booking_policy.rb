class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
