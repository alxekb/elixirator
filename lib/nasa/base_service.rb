# frozen_string_literal: true

module Nasa
  # Base service class to share common servises methods
  class BaseService
    STATUS = { success: :success, error: :error }.freeze

    def success?
      status == STATUS[:success]
    end

    def call
      raise StandardError, 'Don\'t call BaseService directly, use descendants'
    end

    def response
      puts("fuel requred: #{fuel_weight.to_f} kg")
    end

    def error_messages
      errors.each(&:to_s)
    end
  end
end
