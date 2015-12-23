class BusinessPolicy < ApplicationPolicy

  def index?
    user.present?
  end
end

