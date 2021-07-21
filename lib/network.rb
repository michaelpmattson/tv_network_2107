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

  def actors_by_show
    actors_by_show = Hash.new { |hash, key| hash[key] = [] }
    shows.each do |show|
      actors_by_show[show] = show.actors
    end
    actors_by_show
  end
end
