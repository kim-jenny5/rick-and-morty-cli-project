class CLI

    @@rick_name = "Rick"
    @@rick = "#{@@rick_name}".upcase.bold.colorize(:green)

    @@morty_name = "Morty"
    @@morty = "#{@@morty_name}".upcase.bold.colorize(:green)

    @@random_arr = []

    def user_input
        sleep(0.5)
        puts "YOU".colorize(:green)
        gets.strip
    end
    
    def starts
        puts "#{@@rick}"
        puts "Burrrp. Oops. I mean, yo what's up? Welcome to the world of Rick and Mortyyyyyy!"
        sleep(3)

        puts "Let's get schwifty and tell us your name dawg!"
        puts

        name = user_input
        greets(name)
    end

    def greets(name)
        sleep(1)
        puts
        puts "#{@@rick}"
        puts "#{(name.upcase).italic}!!! So what do you wanna do today? Huh? Whadya wanna do??"
        sleep(1)
        puts "Don't be like Morty and choose decisively!"
        sleep(2.5)
        
        puts
        puts "#{@@morty}"
        puts "Aw jeez Rick... Sorry about him man."
        sleep(2)
        puts "Whenever you're ready, tell us the number you want to see from the menu below!"
        sleep(2.5)

        first_time_menu
    end

    def base_menu
        puts
        puts "1. Let's stalk some characters! 😈"
        puts "2. Let's have some fun! 🤪"
        puts "3. Do you wanna develop an app??? 👩🏻‍💻"
        puts "4. Nah, I want to leave. I don't even like Rick and Morty."
    end

    def first_time_menu
        base_menu
        puts
        selection = user_input

        if selection.include?("1")
            character_info_prelude
        elsif selection.include?("2")
            fun
        elsif selection.include?("3")
            app
        elsif selection.include?("4")
            sleep(1)
            leaves
        else
            invalid_answer
        end
    end

    def menu
        base_menu
        puts
        selection = user_input

        if selection.include?("1")
            character_info_directions
        elsif selection.include?("2")
            fun
        elsif selection.include?("3")
            app
        elsif selection.include?("4")
            sleep(1)
            leaves
        else
            invalid_answer
        end
    end

    def character_info_prelude
        sleep(1)
        puts
        puts "#{@@rick}"
        puts "Bet Morty stalks Jessica on da socials. 👀"
        
        sleep(1.5)
        puts
        puts "#{@@morty}"
        puts "#{@@rick_name}!".upcase.bold
        
        sleep(1)
        puts
        puts "#{@@rick}"
        puts "And awayyyyyyy we goooooo!"
        sleep(1.5)

        character_info_directions
    end

    def character_info_directions
        puts
        puts "Which character do you wanna know more about?"
        puts "Enter a specific name or 'list' for 5 random characters."
        character_info
    end

    def character_info
        puts
        input = user_input
        puts

        char = Character.all.select {|char| char.name.include?(input)}

        if input == "list"
            puts "Characters:".underline
        
            if @@random_arr.size == 0
                5.times {@@random_arr << rand(Character.all.length)}
                output_list
                # @@random_arr.each.with_index(1) do |object_num, index|
                #     character = Character.all[object_num]
                #     puts "#{index}. #{character.name}"
                # end
                # sleep(1.5)
                # puts
                # puts "To know more about a character from this list, enter the number next to their name!"
                # puts "Otherwise, press anything to be taken back to the menu."
                # options_after_list
            else
                output_list
                # @@random_arr.each.with_index(1) do |object_num, index|
                #     character = Character.all[object_num]
                #     puts "#{index}. #{character.name}"
                # end
                # sleep(1.5)
                # puts
                # puts "To know more about a character from this list, enter the number next to their name!"
                # puts "Otherwise, press anything to be taken back to the menu."
                # options_after_list
            end
            # @@random_arr << 5.times {rand(Character.all.length)}
            # 5.times {@@random_arr << rand(Character.all.length)}
            # @@random_arr.each.with_index(1) do |object_num, index|
            #     character = Character.all[object_num]
            #     puts "#{index}. #{character.name}"
                # puts "Species: #{attributes.species}"
                # puts "Type: #{attributes.type}"
                # puts "Current location: #{attributes.location}"
                # puts "Episode count: #{attributes.episode.count}"

                # Character.all[index].each do |attributes|
                #     puts "Name: #{attributes.name}"
                #     puts "Species: #{attributes.species}"
                #     puts "Type: #{attributes.type}"
                #     puts "Current location: #{attributes.location}"
                #     puts "Episode count: #{atttributes.episode.count}"
                # end
            # end
            # puts
            # puts "If you'd like to know more about a character from this list, enter the number next to their name!"
            # puts "Otherwise, press anything to be taken back to the menu."
            # sleep(1.5)
            # puts
        elsif char.count > 1
            versions = []

            char.map.with_index(1) do |char_obj, index|
                versions << "Version ##{index}: #{char_obj.name} - #{char_obj.location}"
            end

            versions.each {|x| puts x}
            # Need to put in an option to know more about the characters or go to the menu. 
        elsif char.count == 1
            @inside_char = char[0]
            if @inside_char.type == ""
                no_type
                puts "Episode count: #{@inside_char.episode.count}"
            else
                no_type
                puts "Type: #{@inside_char.type}"
                puts "Episode count: #{@inside_char.episode.count}"
            end
            # puts "Name: #{inside_char.name}"
            # puts "Species: #{inside_char.species}"
            # puts "Type: #{inside_char.type}"
            # puts "Episode Count: #{inside_char.episode.count}"
            # puts
            sleep(1.5)
            puts
            puts "#{@@morty}"
            puts "Do you wanna see the menu again?"
            puts
            puts "Enter 'yes' for menu. Otherwise, you'll be exited out of the app. 😢"
            puts
            yn_input = user_input
            if yn_input == "y" || yn_input == "yes"
                menu
            else
                sleep(1)
                leaves
            end
        else
            invalid_answer
            character_info
        end
    end

    def output_list
        @@random_arr.each.with_index(1) do |object_num, index|
            character = Character.all[object_num]
            puts "#{index}. #{character.name}"
        end
        sleep(1.5)
        puts
        puts "To know more about a character from this list, enter the number next to their name!"
        puts "Otherwise, press anything to be taken back to the menu."
        options_after_list
    end

    # 1:23 pm FIXXXXX
    def options_after_list
        # puts "If you'd like to know more about a character from this list, enter the number next to their name!"
        # puts "Otherwise, press anything to be taken back to the menu."
        # sleep(1.5)
        # input = user_input

        # # if input == 

        # puts "Would you like to know more about a character from this list?"
        # puts "Enter yes. Otherwise you'll be taken back to the menu."
        # sleep(1.5)
        # input_after_options


        # NEW EDIT
        sleep(2)
        puts
        char_list_input = user_input.to_i
        puts

        char_index = @@random_arr[char_list_input-1]

        if @@random_arr.include?(char_index)
            character = Character.all[char_index]
            puts "Name: #{character.name}"
            puts "Species: #{character.species}"
            if character.type == ""
                puts "Current location: #{character.location}"
                puts "Episode count: #{character.episode.count}"
            else
                puts "Type: #{character.type}"
                puts "Current location: #{character.location}"
                puts "Episode count: #{character.episode.count}"
            end
            sleep(2)
            puts
            puts "To see a different character, enter a number from the same list above."
            puts "Otherwise, you can press anything to return back to the menu!"
            if char_list_input == (1..5)
                # (1..5).include?(char_list_input)
                options_after_list
            elsif char_list_input != (1..5)
                puts
                puts "#{@@morty}"
                puts "I'll take you back to the menu. Come on!"
                sleep(1.5)
                menu
            end
            # else
            # end
            # Character.all[char_index].each do |attribute|
            #     puts "Name: #{attribute.name}"
            #     puts "Species: #{attribute.species}"
            #     if attribute.type == ""
            #         puts "Current location: #{attribute.location}"
            #     else
            #         puts "Type: #{attribute.type}"
            #     end
            #     # puts "Type: #{attribute.type}"
                # puts "Current location: #{attribute.location}"
        # else
        #     puts
        #     puts "#{@@morty}"
        #     puts "I'll take you back to the menu. Come on!"
        #     sleep(1.5)
        #     menu
        end
    end
    
    # UNNECESSARY
    # def input_after_options
    #     puts
    #     yn_input = user_input

    #     # INCOMPLETE
    #     if yn_input == "y" || yn_input == "yes"
    #         puts
    #         puts "Enter the number next to the character you want to see information on!"
    #         puts
    #         list_char_num = user_input
    #         puts
    #         # need to connect to API here
    #     elsif yn_input == "n" || yn_input == "no"
    #         puts
    #         puts "#{@@morty}"
    #         puts "I'll take you back to the menu. Come on!"
    #         sleep(1.5)
    #         menu
    #     else
    #         invalid_answer
    #         input_after_options
    #     end
    # end

    def no_type
        puts "Name: #{@inside_char.name}"
        puts "Species: #{@inside_char.species}"
    end

    def invalid_answer
        puts
        puts "#{@@morty}"
        puts "Sorry man. That's not an option. Choose something else? 🤷🏻‍♂️"
    end

    def fun
    end

    def app
    end

    def leaves
        puts
        puts "#{@@rick}"
        puts "😒 Whatever you say, 'Stone Cold' Steve Austin."
        sleep(2)
        randomizer
    end

    def randomizer
        puts
        num = rand(1..3)
        if num == 1
            puts "You left to go watch Bob's Burgers for some wholesome family fun."
            puts
        elsif num == 2
            puts "You left to go watch Family Guy for some asinine fun."
            puts
        elsif num == 3
            puts "You left to go watch Bojack Horseman to feel relatability from a drunk, washed-up cartoon horse."
            puts
        end
        sleep(2)
    end
end