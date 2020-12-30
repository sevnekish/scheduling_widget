require 'rails_helper'

RSpec.describe ClientPortalApi::Resources::CptCode do
  let(:endpoint) { 'cpt-codes' }

  it_behaves_like 'ClientPortalApi::Resource'
end
