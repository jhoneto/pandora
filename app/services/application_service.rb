require 'dry-validation'
require 'dry/monads/result'
require 'dry/core'

class ApplicationService
  include Dry::Monads::Result::Mixin
  extend Dry::Core::ClassAttributes

  defines :permissible_errors
  permissible_errors []

  def self.call(params)
    validation = self::ValidationSchema.call(params)
    return Failure.new(validation.errors.to_h) unless validation.success?

    new.execute(params)
  rescue StandardError => error
    handle_error(error)
  end

  def self.handle_error(error)
    raise error unless permissible_errors.any? { |type| error.is_a?(type) }

    Failure.new(error)
  end
end