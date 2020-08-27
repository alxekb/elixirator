# frozen_string_literal: true

module Nasa
  # Here you can find some useful messsages to be sent to user
  class Message
    class << self
      def welcome
        "\nWELCOME TO NASA spaceship project \nYou can prepare the starship for the mission\n"
      end

      def set_mission
        "Please enter spaceship dry weight and path like we did in examples below:\n
1. Apollo 11:
● path: launch Earth, land Moon, launch Moon, land Earth
● weight of equipment: 28801 kg
● weight of fuel: 51898 kg
● arguments: 28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]

2. Mission on Mars:
● path: launch Earth, land Mars, launch Mars, land Earth
● weight of equipment: 14606 kg
● weight of fuel: 33388 kg
● arguments: 14606, [[:launch, 9.807], [:land, 3.711], [:launch, 3.711], [:land, 9.807]]

3. Passenger ship:
● path: launch Earth, land Moon, launch Moon, land Mars, launch Mars, land Earth
● weight of equipment: 75432 kg
● weight of fuel: 212161 kg
● arguments: 75432, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 3.711], [:launch, 3.711], [:land, 9.807]]\n"
      end
    end
  end
end
