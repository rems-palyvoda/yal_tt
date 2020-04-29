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

    it 'responses with status created' do
      post :create, body: json
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'creates new ticket' do
      expect { post :create, body: json }.to change(Ticket, :count).by 0
    end

    it 'creates new excavator' do
      expect { post :create, body: json }.to change(Excavator, :count).by 0
    end
  end
end
