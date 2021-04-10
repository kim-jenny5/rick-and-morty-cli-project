class CLI

    # @@rick_name = "Rick"
    @@rick = "RICK".bold.colorize(:green)

    # @@morty_name = "Morty"
    @@morty = "MORTY".bold.colorize(:green)

    @@random_arr = []
    @@name = nil

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

        @@name = user_input
        greets(@@name)
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
            first_time_menu
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
            menu
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
        puts "RICK!".bold
        
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
            else
                output_list
            end
        elsif char.count > 1
            sleep(1.5)
            puts "This character has multiple versions."
            sleep(1.5)
            puts "All versions will be listed underneath."
            sleep(2)
            puts

            versions = []

            char.map.with_index(1) do |char_obj, index|
                versions << "Version ##{index}: #{char_obj.name} - #{char_obj.location}"
            end

            versions.each {|version_info| puts version_info}

            sleep(2)
            puts
            puts "#{@@rick}"
            puts "Yeah yeah yeah. There are multiple '#{input}'s across multiple universes."
            sleep(2)
            puts
            puts "#{@@morty}"
            puts "Sigh. Okay Rick..."
            sleep(4)
            puts "In the meantime, let's take you back to the menu #{@@name}. Let's go!"
            sleep(2.5)
            menu

            # puts "#{@@morty}"
            # puts "If you wanna know more about a version, enter the character's version number!"
            # puts "Otherwise, you'll be returned to the menu."
            # sleep(1.5)
            # puts
            # more_input = user_input
            # puts
            # if (1..versions.length).include?(more_input) == true
            #     char_ver = char[more_input-1]
            #     puts "Name: ".colorize(:cyan) + "#{char_ver.name}"
            #     puts "Species: ".colorize(:cyan) + "#{char_ver.species}"
            #     if char_ver.type == ""
            #      puts "Current location: ".colorize(:cyan) + "#{char_ver.location}"
            #      puts "Episode count: ".colorize(:cyan) + "#{char_ver.episode.count}"
            #     else
            #      puts "Type: ".colorize(:cyan) + "#{char_ver.type}"
            #      puts "Current location: ".colorize(:cyan) + "#{char_ver.location}"
            #      puts "Episode count: ".colorize(:cyan) + "#{char_ver.episode.count}"
            #     end
            # else
            #     menu
            # end
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
        puts "Otherwise, press 'm' to be taken back to the menu."
        options_after_list
    end
    
    def list_directions
        sleep(2)
        puts
        puts "To see a different character, enter a number from the same list above."
        puts "Otherwise, you can press 'm' to return back to the menu!"
        options_after_list
    end

    def options_after_list
        sleep(2)
        puts
        char_list_input = user_input

        if (1..5).include?(char_list_input.to_i)
            char_index = @@random_arr[char_list_input.to_i-1]

            if @@random_arr.include?(char_index)
                puts
                character = Character.all[char_index]
                puts "Name: ".colorize(:cyan) + "#{character.name}"
                puts "Species: ".colorize(:cyan) + "#{character.species}"
                if character.type == ""
                    puts "Current location: ".colorize(:cyan) + "#{character.location}"
                    puts "Episode count: ".colorize(:cyan) + "#{character.episode.count}"
                else
                    puts "Type: ".colorize(:cyan) + "#{character.type}"
                    puts "Current location: ".colorize(:cyan) + "#{character.location}"
                    puts "Episode count: ".colorize(:cyan) + "#{character.episode.count}"
                end
            end
            list_directions
        elsif char_list_input == "m" || char_list_input == "menu"
            puts
            morty_menu_prelude
            sleep(1.5)
            menu
        else
            invalid_answer
            options_after_list
        end
        # list_directions
        # options_after_list
    end

    def morty_menu_prelude
        puts "#{@@morty}"
        puts "I'll take you back to the menu #{@@name}. Come on!"
    end

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
        sleep(1)
        puts
        puts "#{@@rick}"
        puts "Wubbalubbadubdub! Tell them, Morty. Go on, tell them their options!"
        sleep(2)
        puts
        puts "#{@@morty}"
        puts "Aw jeez Rick. Why do I gotta?"
        sleep(1)
        puts "Okay #{@@name}. You can choose either of the options below--just enter the number!"
        sleep(4)
        fun_options_menu
    end

    def fun_options_menu
        puts
        puts "(1)  ".bold + "Rick created a device that brings one Rick & Morty character to life."
        puts "     Choose this option to see who you'd generate."
        puts
        puts "(2)  ".bold + "MR. MEESEEKS".bold.colorize(:green)
        puts "     I'm Mr. Meeseeks! Look at me!"
        puts
        puts "     Choose this option to interact with Mr. Meeseeks."
        fun_options
    end

    def fun_options
        puts
        input = user_input
        if input.include?("1")
            fun_opt_1
        elsif input.include?("2")
            fun_opt_2
        else
            invalid_answer
            fun_options
        end
    end

    def fun_opt_1
        # JERRY TEST
        # jerry = Character.all.select {|char| char.name.include?("Jerry")}
        # rand_num = rand(jerry.size)
        # char_generated = jerry[rand_num]

        rand_num = rand(Character.all.size)
        char_generated = Character.all[rand_num]
        sleep(2)

        puts
        puts "#{char_generated.name}".bold
        puts
        puts "Details:".underline
        puts "Species: #{char_generated.species}"
        if char_generated.type != ""
            puts "Type: #{char_generated.type}"
            # puts "Current location: #{char_generated.location}"
        # else
        #     puts "Type: #{char_generated.type}"
        #     puts "Current location: #{char_generated.location}"
        end
        if char_generated.name.include?("Jerry")
            sleep(3)
            puts
            puts "#{@@rick}"
            puts "HAHAHA! In fact, you can take all the infinite Jerry's!!! He's useless in every dimension. 🤨"
            sleep(2.5)
            puts
            puts "#{@@morty}"
            puts "Rick! A-a-at least leave one version of my dad for me, aw jeez."
        end
        sleep(2)
        puts
        puts "#{@@rick}"
        puts "While I get my machine working, you should choose another option dawg."
        sleep(2)
        puts
        puts "Enter 'b' to go back to see another fun option or 'm' to return to the menu."
        input_for_oaf
    end

    def fun_opt_2
        puts
        puts "MR. MEESEEKS".bold.colorize(:green)
        puts "Hi! I'm Mr. Meeseeks! Look at me! How can I help youuu?"
        sleep(1)
        puts
        puts "You can ask Mr. Meeseeks to do anything. Enter your request here!"
        puts
        input = user_input
        if input.length > 15
            sleep(3)
            puts
            puts "Your request to '#{input}'' was too difficult for your Meeseeks."
            sleep(2)
            puts
            puts "MR. MEESEEKS".bold.colorize(:green)
            puts "Existence is pain to a Meeseeks! I just wanna die!"
            sleep(2)
            puts
            puts "Your Meeseeks doesn't want to help you anymore."
            sleep(1.5)
            puts "He's angry at you for such a difficult request and is out to get you now."
            sleep(1.5)
            puts "You run to Rick and Morty for help."
            sleep(2.5)
            puts
            puts "🔫 🔫 🔫 pew pew *laser sounds*"
            sleep(3)
            puts
            puts "#{@@rick}"
            puts "Next time, how about you keep your request to a minimum, HMMMM? 🤨"
            sleep(1)
            puts "Let's take you back to somewhere safe."
            sleep(2)
            puts
            puts "Enter 'b' to go back to see another fun option or 'm' to return to the menu."
            input_for_oaf
        else
            puts
            puts "MR. MEESEEKS".bold.colorize(:green)
            puts "Hi! I'm Mr. Meeseeks! Look at me!!"
            sleep(2.5)
            puts "Allll done! I'm Mr. Meeseeks!"
            sleep(1.5)
            puts
            puts "POOF!"
            sleep(1)
            puts
            puts "Your request to '#{input}' has now been completed."
            sleep(2)
            puts
            puts "#{@@rick}"
            puts "Well, that was fun. 😐 You wanna go back to the menu?"
            sleep(1.5)
            puts
            puts "Enter 'm' for menu. Otherwise, you'll be exited out of the app. 😢"
            puts
            input_two = user_input
            if input_two == "m"
                sleep(1)
                puts
                morty_menu_prelude
                sleep(1.5)
                menu
            else
                leaves
            end
        end
    end

    def input_for_oaf
        puts
        input = user_input
        if input == "b"
            sleep(1)
            fun_options_menu
        elsif input == "m"
            sleep(1)
            puts
            morty_menu_prelude
            sleep(1.5)
            menu
        else
            invalid_answer
            input_for_oaf
        end
    end

    def app
        sleep(1.5)
        puts
        puts "GLOOTIE".bold.colorize(:green)
        puts "Do you wanna develop an app?"
        sleep(1.5)
        puts
        puts "#{@@rick}"
        puts "No thanks, Glootie. They don't want to develop an app."
        sleep(2)
        puts
        puts "Glootie whispers in your ear."
        sleep(1.5)
        puts
        puts "GLOOTIE".bold.colorize(:green)
        puts "Are you sure?? Let's develop an app together!"
        sleep(1.5)
        puts
        puts "If you still want to develop an app, enter 'y' for yes or 'n' for no."
        app_input
    end

    def app_input
        puts
        input = user_input
        if input == "y" || input == "yes"
            sleep(3)
            puts
            puts "You've developed 'Lovefinderzz' and have now wreaked havoc in your world."
            sleep(2.5)
            puts "Earth's water supply has been stolen by the Monogatrons."
            sleep(2)
            puts "Shouldn't have developed an app..."
            sleep(2.5)
            puts
            puts "Since you've developed a deadly app, you'll be exited out now."
            sleep(3)
        elsif input == "n" || input == "no"
            sleep(1.5)
            puts
            puts "GLOOTIE".bold.colorize(:green)
            puts "Cool. Well, if anyone wants to develop an app with me, I'm down."
            sleep(2.5)
            puts
            puts "#{@@rick}"
            puts "Smart for not developing that app, #{@@name}."
            sleep(1.5)
            puts
            morty_menu_prelude
            sleep(2)
            menu
        else
            invalid_answer
            app_input
        end
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