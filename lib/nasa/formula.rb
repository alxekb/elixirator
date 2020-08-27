# frozen_string_literal: true

require 'bigdecimal'

module Nasa
  # Fuel calculation dark magic lives here.
  # Use it well!
  class Formula
    attr_accessor :mass, :gravity

    def initialize(mass, gravity)
      @mass = mass       # BigDecimal(mass, 3)
      @gravity = gravity # BigDecimal(gravity, 3)
    end

    def launch
      mass * gravity * 0.042 - 33
    end

    def land
      mass * gravity * 0.033 - 42
    end

    def method_missing(method, *_args)
      raise StandardError, "Calculation error calling #{self.class}##{method}"
    end
  end
end
