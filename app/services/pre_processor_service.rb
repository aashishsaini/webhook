class PreProcessorService

  class InvalidPayload < StandardError; end

  def initialize(payload)
    raise InvalidPayload unless is_valid?(payload)
    @payload = payload
  end

  def create
    WebhookEvent.create(
        issue_id: @payload.dig(:issue).dig(:number),
        action: @payload.dig(:action),
        response_body: @payload
    )
  end

  private
  # validate if payload is valid or not
  def is_valid?(payload)
    keys.all? {|s| payload.key? s.to_sym} && payload.present?
  end

  # keys required in payload
  def keys
    %w{action issue}
  end
end