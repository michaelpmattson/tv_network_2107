require './lib/character'
require './lib/show'

RSpec.describe Show do
  context '#initialize' do
    it 'exists' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      expect(knight_rider).to be_an_instance_of(Show)
    end

    it 'has attributes' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      expect(knight_rider.name).to eq("Knight Rider")
      expect(knight_rider.creator).to eq("Glen Larson")
      expect(knight_rider.characters).to eq([michael_knight, kitt])
    end
  end

  context '#total_salary' do
    it 'returns total salaries for all actors' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      expect(knight_rider.total_salary).to eq(2600000)
    end
  end

  context '#highest_paid_actor' do
    it 'returns highest paid character.actor' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      expect(knight_rider.highest_paid_actor).to eq("David Hasselhoff")
    end
  end

  context '#actors' do
    it 'returns array of character.actors' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
      knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

      expect(knight_rider.actors).to eq(["David Hasselhoff", "William Daniels"])
    end
  end
end
