class Api::BaseController < ApplicationController
  def render_not_found_response(error)
    error_payload = ErrorPayload.new(
      I18n.t('error_messages.record_not_found.title'),
      :not_found,
      error.message
    )

    render json: { errors: [ error_payload ]}, status: :not_found
  end
end
