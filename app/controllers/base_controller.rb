# frozen_string_literal: true

class BaseController < ApplicationController
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!
  before_action :authorize_action
  after_action :verify_authorized

  def user_not_authorized
    flash[:alert] = 'Seu usuário não possui autorização para essa ação.'
    redirect_to(request.referer || root_path)
  end

  private

  def authorize_action
    authorize(controller_name.classify.constantize)
  end
end
