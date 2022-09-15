# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      #raise NotImplementedError, "You must define #resolve in #{self.class}"
      scope.where(organization_id: user.organization_id)
    end

    private

    attr_reader :user, :scope
  end

  private

  def verify_access(action)

    model = self.class.to_s.gsub('Policy','').underscore.downcase
    user.has_access?("#{model}_#{action}")
  end
end
