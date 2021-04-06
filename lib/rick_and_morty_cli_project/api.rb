class API
    def self.extracting_data
        response = RestClient.get('https://rickandmortyapi.com/api')
        # response = RestClient.get('https://rickandmortyapi.com/api/character')        
        data = JSON.parse(response.body)
        # data.each do |character|
        #     character
        # end
        binding.pry
    end
end