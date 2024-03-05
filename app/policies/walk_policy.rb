class WalkPolicy < ApplicationPolicy
  class Scope < Scope
    def index?
      true
    end

    def new?
      true
    end

    def show?
      true
    end

    def create?
      true
    end

    def edit?
      record.user == user
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end
  end
end
