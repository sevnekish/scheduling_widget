require 'rails_helper'

RSpec.describe ClientPortalApi::Request do
  describe '#call' do
    subject do
      described_class.new(
        endpoint: endpoint,
        method: method,
        query_params: query_params
      ).call
    end

    let(:endpoint) { 'some_endpoint' }
    let(:method) { :get }
    let(:query_params) do
      {
        filters: {
          clinician_id: 2
        }
      }
    end

    let(:faraday_client) { double(:faraday_client) }
    let(:response_body) { { data: [] } }
    let(:faraday_response) { double(:faraday_response, body: response_body) }

    before do
      allow(Faraday)
        .to receive(:new)
        .with(
          url: 'https://test-portal-api',
          headers: ClientPortalApi::Configuration::DEFAULT_HEADERS
        )
        .and_return(faraday_client)

      allow(faraday_client).to receive(:get).and_return(faraday_response)
      allow(ClientPortalApi::Response).to receive(:new)
    end

    context 'success' do
      it 'returns response object' do
        expect(faraday_client).to receive(:get).with('some_endpoint?' + { filters: { clinicianId: 2 } }.to_query)
        expect(ClientPortalApi::Response).to receive(:new).with(response_body)

        subject
      end
    end
  end
end
