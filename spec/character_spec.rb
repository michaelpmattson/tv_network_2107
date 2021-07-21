require './lib/character'

RSpec.describe Character do
  context '#initialize' do
    it 'exists' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})

      expect(kitt).to be_an_instance_of(Character)
    end

    it 'has attributes' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})

      expect(kitt.name).to eq("KITT")
      expect(kitt.actor).to eq("William Daniels")
      expect(kitt.salary).to eq(1000000)
    end
  end

  context '#bankroll?' do
    it 'returns true if character makes 500_000' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
      tubbs = Character.new({name: "Tubbs", actor: "Philip Michael Thomas", salary: 500_000})

      expect(kitt.bankroll?).to be(true)
      expect(tubbs.bankroll?).to be(false)
    end
  end
end
