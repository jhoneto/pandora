# frozen_string_literal: true

class DashboardController < BaseController
  skip_before_action :authorize_action

  def index
    authorize :dashboard, :index?
  end
end
