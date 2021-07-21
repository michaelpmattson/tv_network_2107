require './lib/character'

RSpec.describe Character do
  context '#initialize' do
    it 'exists' do
      kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})

      expect(kitt).to be_an_instance_of(Character)
    end
  end
end

#
# kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
# # => #<Character:0x00007f98a4ba8dc8...>
#
# kitt.name
# # => "KITT"
#
# kitt.actor
# # => "William Daniels"
#
# kitt.salary
# # => 1000000
