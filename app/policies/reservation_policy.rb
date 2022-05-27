class ReservationPolicy < ApplicationPolicy

  def new
    create?
  end
  def create?
    true
  end
  def destroy?

  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
