class Astronaut < ApplicationRecord
  has_many :space_missions
  has_many :space_missions, through: :astronaut_spacemissions


  validates_presence_of :name, :age, :job

  def self.average_age
    Astronaut.average("age")
  end
end
