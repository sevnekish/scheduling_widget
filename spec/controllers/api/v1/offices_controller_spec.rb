require 'rails_helper'

RSpec.describe Api::V1::OfficesController, type: :controller do
  describe 'GET #index' do
    subject { get :index, params: { cpt_code_id: 6 } }

    context 'success', vcr: { cassette_name: 'offices_index_success'} do
      let(:expected_response) do
        [
          {
            id: '1',
            city: 'Port Alyssonbury',
            name: 'Main Office',
            state: 'NV',
            street: 'Elise Drive',
            zip: '51859',
            phone: '(626) 298-1956',
            geolocation: {
              lat: '41.503895',
              lng:'-74.349776'
            }
          }
        ]
      end

      it { is_expected.to have_http_status :ok }

      it 'responds with serialized offices' do
        subject

        expect(json_response).to eq(expected_response)
      end
    end

    context 'failure', vcr: { cassette_name: 'offices_index_failure' } do
      it { is_expected.to have_http_status :bad_request }

      it 'responds with error message' do
        subject

        expect(json_response).to eq({ error: 'param is missing or the value is empty: filter' })
      end
    end
  end
end
