require 'rails_helper'

RSpec.describe ClientPortalApi::Resources::Office do
  let(:endpoint) { 'offices' }

  it_behaves_like 'ClientPortalApi::Resource'
end
