class CLI

    @@rick_name = "Rick"
    @@rick = "#{@@rick_name}".upcase.bold.colorize(:green)

    @@morty_name = "Morty"
    @@morty = "#{@@morty_name}".upcase.bold.colorize(:green)

    def starts
        puts "#{@@rick}"
        puts "Burrrp. Oops. I mean, yo what's up? Welcome to the world of Rick and Mortyyyyyyyyy!"
        sleep(3)

        puts "Let's get schwifty and tell us your name dawg!"
        puts
        input = user_input

        greets(input)
    end

    def user_input
        puts "YOU".colorize(:green)
        gets.strip
    end

    def greets(name)
        sleep(1)
        puts
        puts "#{@@rick}"
        puts "#{(name.upcase).italic}!!! So what do you wanna do today? Huh? Whadya wanna do?? Don't be like Morty and choose decisively!"
        sleep(5)
        
        puts
        puts "#{@@morty}"
        puts "Aw jeez Rick... Sorry about him man."
        sleep(2)
        puts "Whenever you're ready, tell us the number you want to see from the menu below!"
        sleep(2)

        menu
    end

    def menu
        puts
        puts "1. Let's stalk some characters! 😈"
        puts "2. Let's have some fun! 🤪"
        puts "3. Do you wanna develop an app??? 👩🏻‍💻"
        puts "4. Nah, I want to leave. I don't even like Rick and Morty."
        puts 

        selection = user_input
        if selection.include?("4")
            sleep(1)
            leaves
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
        puts "Bye bye!"
    end
end