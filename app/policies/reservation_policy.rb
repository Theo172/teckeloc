class ReservationPolicy < ApplicationPolicy

  def new?
    create?
  end
  def create?
    true
  end
  def edit?
    update?
  end
  def update?
    record.teckel.user == user
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
