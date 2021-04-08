class CLI
    def starts
        puts "RICK:"
        puts "Burrrp. Oops. I mean, yo what's up? Welcome to the world of Rick and Mortyyyyyyyyy!"
        sleep(6)

        puts "Let's get schwifty and tell us your name dawg!"
        input = user_input

        greets(input)
        sleep(3)
    end

    def user_input
        gets.strip
    end

    def greets(name)
        puts "RICK:"
        puts "'#{name.upcase}!!! So what do you wanna do today? Huh? Whadya wanna do?? Don't be like Morty and choose decisively!'"
        sleep(7)
        
        puts "MORTY:"
        puts "'Aw jeez Rick... Sorry about him man. Whenever you're ready, let us know what you wanna see by telling us the number from the menu below!'"
        sleep(3)
    end
end