# frozen_string_literal: true

module Api
  module V1
    class TicketsController < ApiController
      before_action :build_ticket_and_excavator, only: %i[create]

      def create
        @ticket.valid? && @excavator.valid? ? save_records : respond_with_errors
      end

      private

      def save_records
        @ticket.save
        @excavator.save

        render json: {
          ticket: JSON(@ticket.to_json),
          excavator: JSON(@excavator.to_json)
        }, status: :created
      end

      def respond_with_errors
        render json: {
          errors: { ticket: @ticket.errors.messages,
                    excavator: @excavator.errors.messages }
        }, status: :unprocessable_entity
      end

      def build_ticket_and_excavator
        extractor = AttributesExtractor.new(JSON(request.raw_post))
        @ticket = Ticket.new(extractor.ticket)
        @excavator = @ticket.build_excavator(extractor.excavator)
      end
    end
  end
end
