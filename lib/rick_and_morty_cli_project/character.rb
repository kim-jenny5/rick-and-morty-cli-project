class Character
    attr_accessor :name, :status, :species, :type, :origin, :location

    #will comment this out later
    def initialize(name, status, species, type, origin, location)
        @name = name
        @status = status
        @species = species
        @type = type
        @origin = origin
        @location = location
    end

    #should be done this way, will uncomment out later
    # def initialize(attributes)
    #     attributes.each do |key, value|
    #         self.send(("#{key}="), value)
    #     end
    # end
end