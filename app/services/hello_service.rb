class HelloService < ApplicationService

  ValidationSchema = Dry::Schema.Params do
    required(:message).filled(:string)
  end

  def execute(params)
    puts params[:message]

    Success.new(true)
  end
end