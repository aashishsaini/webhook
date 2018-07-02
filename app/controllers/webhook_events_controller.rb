class WebhookEventsController < ApplicationController
  include GithubWebhook::Processor

  def create
    PreProcessorService.new(params).create
  end

  def index
    @webhook_events = WebhookEvent.where(issue_id: params[:issue_id]).collect{|s| {action: s.action, created_at: s.created_at}}
    render json: @webhook_events
  end

  private
  # define method call to pass env variable contains secret
  def webhook_secret(payload)
    WEBHOOK_CONFIG['webhook_secret']
  end

end
