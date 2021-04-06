class API
    def self.extracting_data
        #You need to figure out how to use this one gigantic API!!!!
        response = RestClient.get('https://rickandmortyapi.com/api')
        # response = RestClient.get('https://rickandmortyapi.com/api/character')        
        # response = RestClient.get('https://rickandmortyapi.com/api/character?page=2')        
        data = JSON.parse(response.body)
        # data.each do |character|
        #     character
        # end
        binding.pry
    end
end

#data["results"].select {|character| character["name"] == "Beth Smith"}
#data["results"].select {|character| character["name"].include?("Beth")}