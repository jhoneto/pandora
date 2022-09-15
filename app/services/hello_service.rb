# frozen_string_literal: true

class HelloService < ApplicationService
  ValidationSchema = Dry::Schema.Params do
    required(:message).filled(:string)
  end
  public_constant :ValidationSchema

  def execute(params)
    Rails.logger.debug(params[:message])

    Success.new(true)
  end
end
