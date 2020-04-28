# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:ticket) { create(:ticket) }

  describe 'GET index' do
    before(:each) { get :index }

    it 'assigns @tickets' do
      expect(assigns(:tickets)).to eq([ticket])
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    before(:each) { get :show, params: { id: ticket.id } }

    it 'assigns @ticket' do
      expect(assigns(:ticket)).to eq(ticket)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end
end
