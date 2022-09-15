# frozen_string_literal: true

class CompanyPolicy < ApplicationPolicy
  def index?
    verify_access(__method__)
  end
end