# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'ticket has not been created' do
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
