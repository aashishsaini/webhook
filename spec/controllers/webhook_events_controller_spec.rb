require 'rails_helper'

RSpec.describe WebhookEventsController, type: :controller do
  describe '#index' do
    context 'request events with issue_id' do
      it 'returns status 200' do
        create(:webhook_event)
        get :index, params: { issue_id: 2 }
        expect(response).to be_success
      end
    end
  end
end