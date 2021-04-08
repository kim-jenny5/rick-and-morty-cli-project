class API

    @@all_pages = []

    def self.set_up
        base_url = "https://rickandmortyapi.com/api/character"
        response = RestClient.get(base_url)
        data = JSON.parse(response)

        total_pages = data["info"]["pages"]
        #total_pages = 34 (as of April 2021)
        
        page_number = 0
        until page_number == total_pages
            page_number += 1
            @@all_pages << "#{base_url}?page=#{page_number}"
        end

        self.extracting_data
    end

    def self.extracting_data
        all_data = []

        @@all_pages.each do |url|
            individual_page = RestClient.get(url)
            all_data << JSON.parse(individual_page)["results"]
        end

        characters = all_data.flatten

        # binding.pry

        characters.each do |character|
            Character.new(character["name"], character["species"], character["type"], character["location"]["name"], character["episode"])
        end
    end
end

# Character.all.select {|character| character.name.include?("Beth")}
# Character.all.select {|character| character.name == "Beth Smith"}