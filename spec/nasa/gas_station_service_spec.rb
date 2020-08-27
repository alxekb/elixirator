# frozen_string_literal: true

require_relative '../../lib/nasa/gas_station_service'

RSpec.describe Nasa::GasStationService do
  let(:apollo_mass) { '28801' }
  let(:apollo_mission) { '[[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]' }
  let(:service) { described_class.new(apollo_mass, apollo_mission) }

  it 'calculates fuel amount for Apollo 11' do
    subject = service.call

    expect(service.status).to eq(:success)
    expect(service.spaceship_dry_weight).to eq(28_801)
    expect(service.spaceship_mission).to eq([[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]])
    expect(service.fuel_weight).to eq(51_898)
  end
end
