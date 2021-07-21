class Network
  attr_reader :name,
              :shows

  def initialize(name)
    @name  = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    main = []
    characters.each do |character|
      main << character if character.bankroll? && character.upcase?
    end
    main
  end

  def characters
    shows.flat_map do |show|
      show.characters
    end
  end
end
