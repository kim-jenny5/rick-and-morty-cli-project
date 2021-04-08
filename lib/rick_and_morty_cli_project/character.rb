class Character
    attr_accessor :name, :species, :type, :location, :episode

    @@all = []

    #I want to metaprogram this later and refactor
    def initialize(name, species, type, location, episode)
        @name = name
        @species = species
        @type = type
        @location = location
        @episode = episode
        save
    end

    # Metaprogramming not working for some reason
    # def initialize(attributes)
    #   attributes.each do |key, value|
    #       self.send(("#{key}="), value)
    #   end
    #   save
    # end

    def save
        @@all << self
    end

    def self.all
      @@all
    end

    # if @type == ""
    # end
    # later use REJECT for ommitting this attributes for certain characters

    # characters.select {|character| character["name"].include?("Morty")}
    # This gets all "Morty" characters
end