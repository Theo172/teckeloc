class TeckelPolicy < ApplicationPolicy
  def new?
    create?
  end
  def create?
    true
  end
  def show?
    true
  end
  def edit?
    update?
  end
  def destroy?
    record.user == user
  end
  def update?
    record.user == user
  end

  def payment?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
