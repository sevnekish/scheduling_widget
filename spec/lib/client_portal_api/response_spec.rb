require 'rails_helper'

RSpec.describe ClientPortalApi::Response do
  let(:json_body) { {}.to_json }
  let(:instance) { described_class.new(json_body) }

  describe '.errors' do
    subject { instance.errors }

    context 'failure response body' do
      let(:json_body) { file_fixture('client_portal_api/failure_response_body.json').read }

      it 'returns array of errors' do
        expect(subject).to match_array(['param is missing or the value is empty: filter'])
      end
    end

    context 'success response body' do
      let(:json_body) { file_fixture('client_portal_api/success_response_body.json').read }

      it 'returns empty array of errors' do
        expect(subject).to be_empty
      end
    end
  end

  describe '.data' do
    subject { instance.data }

    context 'failure response body' do
      let(:json_body) { file_fixture('client_portal_api/failure_response_body.json').read }

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end

    context 'success response body' do
      let(:json_body) { file_fixture('client_portal_api/success_response_body.json').read }

      it 'returns array of corresponding objects' do
        first_object = subject.first

        expect(first_object.id).to eq('6')
        expect(first_object.attributes[:description]).to eq('Group Therapy')
      end
    end
  end
end
