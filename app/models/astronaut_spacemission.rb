class AstronautSpacemission < ApplicationRecord
  belongs_to :astronaut
  belongs_to :space_mission
end
