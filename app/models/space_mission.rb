class SpaceMission < ApplicationRecord
has_many :astronauts
has_many :astronauts, through: :astronaut_spacemissions
end
