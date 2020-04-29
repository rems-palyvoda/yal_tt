# frozen_string_literal: true

module Api
  module V1
    class TicketsController < ApiController
      def create
        ticket, excavator = build_ticket_and_excavator

        if ticket.save && excavator.save
          render json: {
            ticket: JSON(ticket.to_json),
            excavator: JSON(excavator.to_json)
          }, status: :created
        else
          render json: {
            errors: [ticket.errors.messages, excavator.errors.messages]
          }, status: :unprocessable_entity
        end
      end

      private

      def build_ticket_and_excavator
        extractor = AttributesExtractor.new(JSON(request.raw_post))
        [ticket = Ticket.new(extractor.ticket), ticket.build_excavator(extractor.excavator)]
      end
    end
  end
end
