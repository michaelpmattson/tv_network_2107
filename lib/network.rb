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

  def shows_by_actor
    shows_by_actor = Hash.new { |hash, key| hash[key] = [] }
    shows.each do |show|
      characters.each do |character|
        if show.characters.include?(character)
          shows_by_actor[character.actor] << show
        end
      end
    end
    shows_by_actor
  end

  def prolific_actors
    prolific_actors = []
    shows_by_actor.each do |actor, shows|
      if shows.count > 1
        prolific_actors << actor
      end
    end
    prolific_actors
  end
end
