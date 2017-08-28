class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true # anyone can create a restaurant on my app
  end

  def update?
    # 1. user -> current_user
    # 2. record -> what you authorize
    user_is_owner_or_admin?  # you can only edit/update if you are the owner
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end













