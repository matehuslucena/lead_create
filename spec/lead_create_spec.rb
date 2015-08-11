require 'spec_helper'

describe LeadCreate do

  it 'does take_lead_object' do
    LeadCreate.connect
    lead = LeadCreate.take_lead
    expect(lead).not_to be_nil
    end

  it 'does list_leads' do
    expect(LeadCreate.list_leads).not_to be_empty
  end
end