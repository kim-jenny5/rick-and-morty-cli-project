class API

    @@all_pages = []

    def self.extracting_data
        base_url = "https://rickandmortyapi.com/api/character?page="
        response = RestClient.get(base_url)
        data = JSON.parse(response.body)

        # url = "https://rickandmortyapi.com/api/character?page="
        # response = RestClient.get(url)
        # data = JSON.parse(response.body)
        total_pages = data["info"]["pages"]
        #total_pages = 34
        
        # last_page_url = "#{url}#{total_pages}"

        page_number = 0
        until page_number == total_pages
            page_number += 1
            @@all_pages << "#{base_url}#{page_number}"
        end
    
        # @@all_pages

        @@all_pages.each do |url|
            individual_response = RestClient.get(url)
            individual_data = JSON.parse(individual_response.body)
        end
        binding.pry

        # url.each do |x|
        #     x += 1
        #     pages = "#{url}#{x}"
        #     responses = RestClient.get(depagination)
        #     datas = JSON.parse(responses.body)    
        # end
        # url
        # binding.pry

        # # until base_url == last_page
        #     count = 1
        #     while count < total_pages
        #         depagination = "#{base_url}#{count}"
        #         responses = RestClient.get(depagination)
        #         datas = JSON.parse(responses.body)    
        #         binding.pry

        #     end
        # end
        # total_pages.times do |page_number|
        #     page_number += 1
        #     depagination = "#{url}#{page_number}"
        #     responses = RestClient.get(depagination)
        #     datas = JSON.parse(responses.body)
    end

    def self.all_pages
        @all_pages
    end
end

#data["results"].select {|character| character["name"] == "Beth Smith"}
#data["results"].select {|character| character["name"].include?("Beth")}