class CLI
    def greeting
        puts "Rick:"
        puts "'Burrrp. Oops. I mean, yo what's up? Welcome to the world of Rick and Mortyyyyyyyyy!'"
        sleep(2)

        puts "'Let's get schwifty and tell us your name dawg!'"
        input

        second_greeting(input)
    end

    def input
        gets.strip
    end

    def second_greeting(name)
        puts "Rick:"
        puts "'#{name.upcase}!!! So what do you wanna do today? Huh? Whadya wanna do?? Don't be like Morty and choose decisively!'"
        sleep(2)
        
        puts "Morty:"
        puts "'Aw jeez Rick... Sorry about him man. Whenever you're ready, let us know what you wanna see by telling us the number from the menu below!'"
        sleep(1)
    end
end