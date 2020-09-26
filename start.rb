require 'tty-prompt'
require './stuff.rb'
require './list_of_maps.rb'
require './player.rb'


def begin_game_dialogue
    prompt=TTY::Prompt.new
    # system('clear')
    # slowly('Hi! Sorry to keep you waiting!')
    # slowly('Welcome to the world of POKEMON!')
    # system('clear')
    # slowly('My name is BIRCH.')
    # slowly('But everyone calls me the POKEMON PROFESSOR.')
    # system('clear')
    # slowly('This is what we call a "POKEMON."')
    # ascii_1
    # slowly('This world is widely inhabited by creatures known as POKEMON.')
    # system('clear')
    # slowly('We humans live alongside POKEMON, at times friendly playmates, and')
    # slowly('at times as cooperative workmates.')
    # slowly('And sometimes, we band together and battle others like us.')
    # system('clear')
    # slowly("But despite out closeness, we don't know everything about POKEMON.")
    # slowly('In fact, there are many, many secrets surrounding POKEMON.')
    # system('clear')
    # slowly("To unravel POKEMON mysteries, I've been undertaking research.")
    # slowly("That's what I do.")
    # system('clear')
    # slowly("And you are?")
    # system('clear')
    # name = ''
    # gender = ''
    # loop do
    #     slowly("Are you a boy? Or are you a girl?")
    #     gender = prompt.select("", %w(BOY GIRL))
    #     system('clear')
    #     if gender == 'BOY'
    #         slowly("All right. What's your name?")
    #         name = prompt.select("", %w(NEW LANDON TERRY SETH TOM))
    #     else 
    #         slowly("All right. What's your name?")
    #         name = prompt.select("", %w(NEW TERRA KIMMY NICOLA SARA)) 
    #     end
    #     system('clear')
    #     if name == 'NEW'
    #         slowly("Enter your name")
    #         name = prompt.ask("") do |q|
    #             q.required true
    #             q.validate /^[a-zA-Z.,]+$/ 
    #             # /regex/ works like quotation marks for print; they encapsulate data
    #             # ^..$ is the start and stop of the regex
    #             # + means you can have more then one character matching
    #             # [a-zA-z] is checking for characters a..z + caps
    #             # ., allows the symbols
    #             q.modify :capitalize
    #         end
    #     end
    #     system('clear')
    #     slowly("So it's #{ name }?")
    #     check = prompt.select("", %w(YES NO))
    #     if check == 'YES'
    #         break
    #     end
    # end
    # player = Player.new(name, gender)
    # system('clear')
    # slowly('Ah, okay!')
    # slowly("You're #{ player.name } who's moving to my hometown of LITTLEROOT.")
    # system('clear')
    # slowly("I get it now!")
    # slowly("All right, are you ready?")
    # system('clear')
    # slowly("Your very own adventure is about to unfold.")
    # system('clear')
    # slowly("Take courage, and leap into the world of POKEMON where dreams,")
    # slowly("adventure, and friendships await!")
    # system('clear')
    # slowly("Well, I'll be expecting you later. Come see me in my POKEMON LAB.")
    # sleep 2
    player = Player.new('Nathan','male')
    Van.new(player).begin
end

begin_game_dialogue