# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ManuscriptsController, type: :controller do

  describe '#index' do
    subject(:do_action) { get :index }

    context 'when there are more than one manuscript' do
      before do
        create_list(:manuscript, 5)
      end

      it 'returns the correct number of objects' do
        do_action
        expect(response_body['manuscripts'].length).to eq(5)
      end
      it 'returns objects with the correct JSON shape' do
        do_action
        response_body['manuscripts'].map do |ms|
          expect(ms.keys).to match_array(
            %w[date_range id shelfmark siglum status witness_count saints_legends]
          )
        end
      end
    end
  end
end
