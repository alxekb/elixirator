require_relative 'nasa/message'
require_relative 'nasa/configuration.rb'
require_relative 'nasa/gas_station_service'

# Class to provide UI for NASA engineers to use Fuel calculation service
class NasaCalc
  def self.welcome_message
    puts Nasa::Message.welcome
  end

  def self.start
    puts Nasa::Message.set_mission

    args_list = STDIN.gets.strip
    dry_weight, mission = args_list.split(',', 2).each(&:strip!)

    service = Nasa::GasStationService.new(dry_weight, mission)

    service.call

    service.success? ? service.response : service.error_messages
  end
end

NasaCalc.welcome_message
NasaCalc.start
