require 'rails_helper'

RSpec.describe Api::V1::CptCodesController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    context 'success', vcr: { cassette_name: 'cpt_codes_index_success'} do
      let(:expected_response) do
        [
          {
            id: '6',
            description: 'Group Therapy',
            duration: 50,
            rate: '300.0'
          }
        ]
      end

      it { is_expected.to have_http_status :ok }

      it 'responds with serialized cpt codes' do
        subject

        expect(json_response).to eq(expected_response)
      end
    end

    context 'failure', vcr: { cassette_name: 'cpt_codes_index_failure' } do
      it { is_expected.to have_http_status :bad_request }

      it 'responds with error message' do
        subject

        expect(json_response).to eq({ error: 'param is missing or the value is empty: filter' })
      end
    end
  end
end
