class Character
    attr_accessor :name, :species, :location#, :image, :episode

    #will comment this out later
    def initialize(name, species, location)
        @name = name
        @species = species
        @location = location
    end

    #should be done this way, will uncomment out later
    # def initialize(attributes)
    #     attributes.each do |key, value|
    #         self.send(("#{key}="), value)
    #     end
    # end
end