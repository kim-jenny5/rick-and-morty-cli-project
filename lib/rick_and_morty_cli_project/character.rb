class Character
    attr_accessor :name, :species, :type, :location, :episode

    @@all = []

    def initialize(name, species, type, location, episode)
        @name = name
        @species = species
        @type = type
        @location = location
        @episode = episode
        save
    end

    def save
        @@all << self
    end

    def self.all
      @@all
    end
end