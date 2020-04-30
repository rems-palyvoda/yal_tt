# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TicketsController, type: :controller do
  let(:json) { raw_test_json }

  context 'when new ticket' do
    describe 'POST create' do
      it 'responses with status created' do
        post :create, body: json
        expect(response).to have_http_status(:created)
      end

      it 'creates new ticket' do
        expect { post :create, body: json }.to change(Ticket, :count).by 1
      end

      it 'creates new excavator' do
        expect { post :create, body: json }.to change(Excavator, :count).by 1
      end
    end
  end

  context 'when present ticket' do
    before(:each) { post :create, body: json }

    it_behaves_like 'ticket has not been created' do
      let(:json) { raw_test_json }
    end
  end

  context 'when empty post json' do
    it_behaves_like 'ticket has not been created' do
      let(:json) { '{}' }
    end
  end

  context 'when json does not have needed keys' do
    it_behaves_like 'ticket has not been created' do
      let(:json) do
        '{  "ContactCenter":"UPCA",
                       "ReferenceRequestNumber":""}'
      end
    end
  end

  context 'when json has invalid values' do
    it_behaves_like 'ticket has not been created' do
      let(:json) { raw_test_json.gsub('ZZGL103', '-----') }
    end
  end
end
