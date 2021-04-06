class API
    def self.extracting_data
        url = "https://rickandmortyapi.com/api/character"

        response = RestClient.get(url)
        # response = RestClient.get('https://rickandmortyapi.com/api/character?page=2')        
        data = JSON.parse(response.body)
        # page_count = data["info"]["pages"]
    end
    # def self.paginating
    # end
end

#data["results"].select {|character| character["name"] == "Beth Smith"}
#data["results"].select {|character| character["name"].include?("Beth")}