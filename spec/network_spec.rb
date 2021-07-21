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
end


# nbc.main_characters
# # => [#<Character:0x00007f98a4ba8dc8...>]
#
# nbc.actors_by_show
# # => {
#       #<Show:0x00007fe5f8398970...> => ["David Hasselhoff", "William Daniels"],
#       #<Show:0x00007fe5f88b0a20...> => ["Amy Poehler", "Nick Offerman"]
# #    }
