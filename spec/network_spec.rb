require './lib/network'
require './lib/show'
require './lib/character'

RSpec.describe Network do
  context '#initialize' do
    it 'exists' do
      nbc = Network.new("NBC")

      expect(nbc).to be_an_instance_of(Network)
    end

    it 'has attributes' do
      nbc = Network.new("NBC")

      expect(nbc.name).to eq("NBC")
      expect(nbc.shows).to eq([])
    end
  end

  context '#add_show(show)' do
    it 'adds a show' do
      nbc = Network.new("NBC")

      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

      expect(nbc.shows).to eq([])

      nbc.add_show(knight_rider)
      nbc.add_show(parks_and_rec)

      expect(nbc.shows).to eq([knight_rider, parks_and_rec])
    end
  end

  context 'main_characters' do
    it 'returns characters making 500_000 and in UPCASE' do
      nbc = Network.new("NBC")

      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

      nbc.add_show(knight_rider)
      nbc.add_show(parks_and_rec)

      expect(nbc.main_characters).to eq([kitt])
    end
  end

  context 'characters' do
    it 'returns all characters' do
      nbc = Network.new("NBC")

      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

      nbc.add_show(knight_rider)
      nbc.add_show(parks_and_rec)

      expect(nbc.characters).to eq([michael_knight, kitt, leslie_knope, ron_swanson])
    end
  end

  context '#actors_by_show' do
      it 'returns hash of actors by show' do
      nbc = Network.new("NBC")

      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

      nbc.add_show(knight_rider)
      nbc.add_show(parks_and_rec)

      expect(nbc.actors_by_show).to eq({
        knight_rider => ["David Hasselhoff", "William Daniels"],
        parks_and_rec => ["Amy Poehler", "Nick Offerman"]
      })
    end
  end

  context '#shows_by_actor' do
    it 'returns shows by actor' do
      nbc = Network.new("NBC")

      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
      baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])

      leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

      nbc.add_show(knight_rider)
      nbc.add_show(baywatch)
      nbc.add_show(parks_and_rec)

      expect(nbc.shows_by_actor).to eq({
           "David Hasselhoff" => [knight_rider, baywatch],
           "William Daniels" => [knight_rider],
           "Amy Poehler" => [parks_and_rec],
           "Nick Offerman" => [parks_and_rec]
         })
    end
  end

  context '#prolific_actors' do
    it 'returns actors in more than one show' do
      nbc = Network.new("NBC")

      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
      baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])

      leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
      ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
      parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

      nbc.add_show(knight_rider)
      nbc.add_show(baywatch)
      nbc.add_show(parks_and_rec)

      expect(nbc.prolific_actors).to eq(["David Hasselhoff"])
    end
  end
end
