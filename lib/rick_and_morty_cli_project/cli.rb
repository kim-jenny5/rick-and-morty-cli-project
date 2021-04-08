class CLI

    @@rick_name = "Rick"
    @@rick = "#{@@rick_name}".upcase.bold.colorize(:green)

    @@morty_name = "Morty"
    @@morty = "#{@@morty_name}".upcase.bold.colorize(:green)
    # "#{(rick.upcase).bold.colorize(:green)}"

    def starts
        puts "#{@@rick}"
        puts "Burrrp. Oops. I mean, yo what's up? Welcome to the world of Rick and Mortyyyyyyyyy!"
        sleep(3)

        puts "Let's get schwifty and tell us your name dawg!"
        input = user_input

        greets(input)
    end

    def user_input
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
        sleep(3)
    end
end