class AddAstronautsToSpaceMission < ActiveRecord::Migration[5.1]
  def change
    add_reference :space_missions, :astronaut, foreign_key: true
  end
end
