RSpec.shared_examples_for 'ClientPortalApi::Resource' do
  describe '.all' do
    subject { described_class.all(options) }

    let(:options) { {} }
    let(:request_instance) { double(:request_instance) }

    before do
      allow(ClientPortalApi::Request).to receive(:new).and_return(request_instance)
      allow(request_instance).to receive(:call)
    end

    it 'calls request class with appropriate endpoint and other params' do
      expect(ClientPortalApi::Request).to receive(:new).with(
        endpoint: endpoint,
        method: :get,
        query_params: nil
      )

      expect(request_instance).to receive(:call)

      subject
    end
  end
end
