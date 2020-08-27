# frozen_string_literal: true

RSpec.describe 'NasaCalc' do
  it 'says a welcome message' do
    expect(STDOUT).to receive(:puts).with Nasa::Message.welcome

    require 'nasa_calc'
  end
end
