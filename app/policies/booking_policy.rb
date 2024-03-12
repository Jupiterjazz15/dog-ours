class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
    # NOTE: Be explicit about which records you allow access to!
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  def validates?
    record.walk.user == user
  end

  def refused?
    record.walk.user == user
  end
end
