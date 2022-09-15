# frozen_string_literal: true

class CompaniesController < BaseController
  def index
    @companies = policy_scope(Company).all
  end
end
