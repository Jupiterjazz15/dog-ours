class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def new?
      true
    end

    def create?
      true
    end

    def destroy?
      record.user == user
    end
  end
end
