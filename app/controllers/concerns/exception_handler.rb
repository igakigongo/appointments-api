module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  # define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    # define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    private

    # JSON response with message; status code 422 - unprocessable entity
    def four_twenty_two(exception)
      json_response({ message: exception.message }, :unprocessable_entity)
    end

    # JSON response witn message; status code 401 - Unauthorized
    def unauthorized_request(exception)
      json_response({ message: exception.message }, :unauthorized)
    end
  end
end
