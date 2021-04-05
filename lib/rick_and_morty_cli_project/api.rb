class API
    def self.extracting_data
        response = RestClient.get('https://rickandmortyapi.com/api')
        data = JSON.parse(response.body)
        binding.pry
    end
end