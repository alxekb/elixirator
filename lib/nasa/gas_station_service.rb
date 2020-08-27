# frozen_string_literal: true

require_relative 'base_service'
require_relative 'formula'

module Nasa
  # Use this service object to handle fuel mass calculation based on
  # spaceship weight and mission.
  class GasStationService < BaseService
    attr_accessor :fuel_weight, :status,
                  :result, :errors,
                  :spaceship_dry_weight,
                  :spaceship_mission

    def initialize(dry_weight, mission)
      @spaceship_dry_weight = dry_weight.to_i
      @fuel_weight = 0 # should we go to BigDecimal('0', 3)?
      # TODO: create workaround with somethimg more secure
      # eval is used to handle user STDIN input params
      @spaceship_mission = eval(mission) # DANGER!!!
      @status = ::Nasa::BaseService::STATUS[:error]
      @errors = []
      @result = []
    end

    def call
      spaceship_mission.each do |m|
        result << compute(m[1], m[0])
      end

      self.status = ::Nasa::BaseService::STATUS[:success] if errors.empty?

      self
    end

    private

    def compute(gravity, action)
      payload = spaceship_dry_weight.to_i + fuel_weight

      f = proc do
        fuel = Nasa::Formula.new(payload, gravity).send action
        if fuel.positive?
          puts([fuel.round_down, action, gravity].join(' '))
          self.fuel_weight = fuel_weight + fuel.round_down
        end

        add_weight = fuel
      end

      payload = f.call until payload.negative?
    end
  end
end

# Define Float#round_down method to use with Nasa::Formula calculation class
# since we have requirements to round down calculation results.
class Float
  def round_down
    string = to_s
    length = string.index('.')

    string.length <= length ? self : string[0, length].to_i
  end
end
