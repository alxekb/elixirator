# frozen_string_literal: true

require 'nasa/message'

RSpec.describe Nasa::Message do
  it 'displays missions available' do
    expect(described_class.select_mission).to eq('Please select a mission ')
  end
end
