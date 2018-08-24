require 'rails_helper'

describe 'user should see astronaut details' do
  before(:each) do
    @astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 30, job: "astronaut")
    @astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 30, job: "astronaut")
    @astronaut_3 = Astronaut.create(name: "John McCainm", age: 30, job: "astronaut")
    @space_mission_1 = SpaceMission.create(title: "Moon Trip", trip_length: 100)
    @space_mission_2 = SpaceMission.create(title: "Mars Trip", trip_length: 100)
    @astronaut_spacemissions = AstronautSpacemission.create(astronaut_id: 1, space_mission_id: 1)
    @astronaut_spacemissions = AstronautSpacemission.create(astronaut_id: 2, space_mission_id: 1)
    @astronaut_spacemissions = AstronautSpacemission.create(astronaut_id: 3, space_mission_id: 2)
  end

  describe 'user visits /astronauts' do
    it 'displays all astronauts and their details' do


      visit '/astronauts'

      expect(page).to have_content(@astronaut_1.name)
      expect(page).to have_content(@astronaut_1.age)
      expect(page).to have_content(@astronaut_1.job)
      expect(page).to have_content(@astronaut_2.name)
      expect(page).to have_content(@astronaut_2.age)
      expect(page).to have_content(@astronaut_2.job)
      expect(page).to have_content(@astronaut_3.name)
      expect(page).to have_content(@astronaut_3.age)
      expect(page).to have_content(@astronaut_3.job)
    end
  end
end

describe 'user should see average astronaut age' do
  describe 'user visits /astronauts' do
    it 'displays average age' do
      visit '/astronauts'

      expect(page).to have_content(Astronaut.average_age)
    end
  end
end

describe 'user should see all astronauts missions' do
  describe 'user visits /astronauts' do
    it 'displays all missions' do
      visit '/astronauts'

      expect(page).to have_content(@astronaut_1.space_missions)
      expect(page).to have_content(@astronaut_2.space_missions)
      expect(page).to have_content(@astronaut_3.space_missions)
    end
  end
end
